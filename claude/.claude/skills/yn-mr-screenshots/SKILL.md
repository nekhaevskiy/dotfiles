---
name: yn-mr-screenshots
description: >
  Capture before/after UI screenshots for a bright-frontend GitLab MR and write them into the
  MR's Screenshots section. Use this skill whenever the user wants to add, update, or refresh
  screenshots on an MR, show a visual before/after of a frontend change, illustrate that a new
  UI element appears, or asks to "update the screenshots" / "add screenshots" / "show the diff
  visually" on a merge request. Drives base-view (or user-portal) in a real browser via the
  Playwright MCP against a live cluster, captures the same screen on the feature branch (after)
  and on main (before), uploads both to GitLab, and rewrites the Screenshots table. Trigger even
  if the user only gives an MR URL/number and says "screenshots" — the defining job is producing
  a real before/after pinned to actual branch states, never mocked or hand-waved images.
---

# MR Before/After Screenshots

Produce a genuine visual before/after for an MR: the same screen captured on the **feature
branch** (after) and on **main** (before), uploaded to GitLab and dropped into the MR
description's Screenshots section. The whole point is that the images are real and pinned to
actual branch states — never fabricate or describe screenshots you didn't take.

## What you need before starting

Ask for whatever's missing — don't guess:

- **MR** — URL or IID (e.g. `757`). Gives you the project path, branch, and where the screenshots go.
- **Cluster IP** — a live cluster to run against. For a conditionally-rendered element (a toggle
  that only shows when the backend reports a feature installable), the cluster **must actually
  report that feature**, or the "after" shot won't show it either.
- **Where to capture** — which screen/state the change is on (e.g. "Kubernetes Setup wizard →
  Operators step"). If the user described the change in conversation, you usually already know.

Confirm the before/after framing. Default and most accurate: **same cluster, branch toggle** —
after = feature branch, before = `main`. The feature branch's code is what makes the element
appear; on `main` the code doesn't exist so the element is genuinely absent.

## Step 1 — Bring up the app

Use the **yn-start-dev** skill (tunnel + `rush update` + `rush rebuild --to <app>` + `rushx start`).
Notes from experience:

- A dev server may already be running on port 3000. Check `curl -s -o /dev/null -w "%{http_code}"
  http://localhost:3000/base-view/` — a `200` means it's up and serving your current branch (Vite
  serves source live, so it reflects whatever branch is checked out). Reuse it instead of fighting
  a "Port 3000 already in use" error.
- The dev server, `rush`, and `git` steps need the sandbox disabled (rush git hooks write to `~/.rush`).

## Step 2 — Make Playwright accept the cluster's self-signed cert

The cluster's API (`https://localhost:8081`) uses a self-signed cert. The Playwright MCP browser
rejects it with `ERR_CERT_AUTHORITY_INVALID` and there's no clickable interstitial in automation.
Fix once by adding `--ignore-https-errors` to the Playwright MCP args, then reload plugins:

```jsonc
// in the playwright MCP config files:
"args": ["@playwright/mcp@latest", "--ignore-https-errors"]
```

Both copies usually need editing (the active one is the cache copy):
- `~/.claude/plugins/cache/claude-plugins-official/playwright/unknown/.mcp.json`
- `~/.claude/plugins/marketplaces/claude-plugins-official/external_plugins/playwright/.mcp.json`

Then the user runs `/reload-plugins` (or restarts). Tell them this is a persistent change they can
revert. Verify by navigating to `http://localhost:3000/base-view/` and confirming the login page
loads (root/system are usually prefilled — click **Log in**).

## Step 3 — Navigate to the target screen (feature branch = "after")

You're on the feature branch already, so this is the "after" capture.

- Find the route in `apps/base-view/src/Route.ts` if you don't know it.
- Use the **non-hash path** form the in-app links use, e.g.
  `http://localhost:3000/base-view/container/kubernetes/setup`. Hash deep-links
  (`#/container/...`) can trigger a Vite "Failed to fetch dynamically imported module" error on a
  cold load; the plain path is reliable. If a deep-link errors, go to the homepage and click through
  the menu instead.
- Drive the UI with `browser_snapshot` (refs change every render — re-snapshot after each action;
  target a parent ref + `depth` to keep snapshots small) and `browser_click`. Wizards gate on
  prior steps, so fill required fields with sensible defaults and click **Continue** through them.
- Get the screen into the exact state the change is about (e.g. enable the new toggle so it reads
  as "visible and enabled").
- Capture a focused **element** screenshot of the relevant panel, not the whole viewport:
  `browser_take_screenshot` with the panel's `target` ref and a clear `filename` (e.g.
  `argocd-after.png`). Read the PNG back to eyeball it before trusting it.

## Step 4 — Capture "before" on main

```bash
git checkout main        # sandbox disabled; working tree must be clean
```

Vite recompiles from the new branch automatically. Reload the page (accept the `beforeunload`
dialog if it appears via `browser_handle_dialog`), re-drive the wizard to the same screen, and
capture the before shot (`argocd-before.png`). Confirm the element is genuinely absent.

Then restore the feature branch:

```bash
git checkout <feature-branch>
```

The untracked PNGs survive the branch switch.

## Step 5 — Upload to GitLab and rewrite the Screenshots section

GitLab MR descriptions reference images uploaded to the project. Upload each PNG to the uploads
endpoint, take the returned `markdown`, and PUT it into the description. Token retrieval and the
description-PUT mechanics are the **yn-gitlab-mr-update** skill — reuse them. The only extra piece
is the upload:

```bash
curl -s -X POST -H "PRIVATE-TOKEN: $TOKEN" \
  -F "file=@argocd-after.png" \
  "https://gitlab-master.nvidia.com/api/v4/projects/$ENCODED_PATH/uploads"
# -> {"markdown":"![argocd-after](/uploads/<hash>/argocd-after.png)", ...}
```

Build a Before/After table from the two `markdown` strings and merge it into the existing
description (preserve everything else — only replace the Screenshots section):

```markdown
### Screenshots

| Before (`main`) | After (this MR) |
| --------------- | --------------- |
| ![before](/uploads/.../before.png) | ![after](/uploads/.../after.png) |
```

Do the upload + PUT in a single Python script (build payload with `json.dumps`, PUT via curl) to
avoid `$TMPDIR` issues — same pattern as yn-gitlab-mr-update. Put any throwaway script in
`reference/` (it's gitignored scratch), and delete it plus the root PNGs when done so nothing
stray gets committed.

## Step 6 — Report and offer cleanup

- Confirm what landed (link the MR) and describe both shots in one line each.
- Remind the user the `--ignore-https-errors` change is persistent if they want it reverted.
- Offer to stop the tunnel + dev server (yn-start-dev "stop"), and if the MR is a Draft, offer to
  mark it ready (yn-gitlab-mr-update).
```
