---
name: yn-plan-jira
description: Plan the implementation of a Jira ticket — fetch the ticket, gather the related GitLab MRs/commits, then produce an implementation plan. Use this skill whenever the user asks to plan, scope, design, or figure out how to implement a Jira issue: "plan implementation of BCM-37067", "how should I implement this ticket", "plan BCM-XXXXX", a bare Jira URL with "plan"/"scope"/"approach", or any request to turn a Jira ticket into an implementation plan. The defining job of this skill is to make sure the related GitLab MRs and commits are checked BEFORE planning — and to ask the user for them explicitly when they aren't available, never to guess.
---

# Plan a Jira Ticket's Implementation

The goal is an implementation plan grounded in what's *already been done elsewhere*. Most tickets here are one slice of cross-repo work (a CLI change lands first, then the Base View mirror; or a backend change, then the frontend). The related MRs and commits are the ground truth for naming, config keys, option shapes, and behavior — planning without them produces plausible-but-wrong guesses. So gathering that context is not optional, and it comes before any planning.

## Step 1: Fetch the ticket and its links

Call `jira_get_issue` for the ticket with fields `summary, description, status, issuetype, issuelinks, components, labels`. Read the description's "Related" / "Depends on" notes and the `issuelinks` — these name the sibling tickets (e.g. the CLI ticket that the frontend ticket mirrors). Fetch those linked tickets too when they look relevant.

## Step 2: Get the related GitLab MRs/commits — and ask if you can't see them

This is the step that's easy to skip and must not be.

**Critical limitation:** The Jira **Development panel** — the "N commits / M merge requests / branches" links shown in the ticket UI — is served by a *separate dev-status API that `jira_get_issue` does NOT return.* It is absent from the standard fields, from `issuelinks`, and from comments. You literally cannot see it through the Jira tools. Comments sometimes hint at it textually ("the change is in trunk", "now in 11.0", an assignee name) but rarely carry the URLs.

So:

- Check what you *can* see first: the ticket description, `issuelinks`, and the comments (fetch with `expand_comments: true` if a comment might hold a link). Sibling tickets often name their own repo in the title (e.g. "Add X to cm-kubernetes-setup").
- If, after that, you do **not** have the actual MR URL(s) or commit SHAs for the related work, **stop and ask the user explicitly.** Tell them plainly that the Jira Development panel isn't accessible via the API and that you need them to paste the links. Do **not** fall back to blindly guessing GitLab project paths or searching repositories — that wastes turns and misses the real change.

  Example ask: *"BCM-XXXXX looks like it mirrors work already done elsewhere, but the linked MRs/commits live in Jira's Development panel, which I can't read through the API. Can you paste the MR URL(s) or repo+commit SHAs for the related change?"*

- Once you have a GitLab MR URL like `https://gitlab-master.nvidia.com/bcm/cm/cm-setup/-/merge_requests/757`, extract `project_id` (the path between host and `/-/merge_requests/`) and the MR iid, then pull it with `gitlab_get_merge_request` and `gitlab_get_merge_request_diffs`. For a commit, use `gitlab_get_commit` with the project path and SHA.

Read the diffs for the things a plan actually needs: exact identifiers/keys (a config key like `Argo CD` with the space matters), whether a feature carries user-facing **options** or is just a toggle, and which layers the sibling change touched.

## Step 3: Explore this repo

Find where the analogous change goes in this codebase and the existing pattern to mirror (an Explore subagent is good for this when scope is uncertain). Confirm there's no existing utility/component to reuse before proposing new code.

## Step 4: Write the plan

If running in plan mode, write to the plan file and end with `ExitPlanMode`. Otherwise present the plan inline. A good plan here includes:

- **Context** — why the change exists, what sibling work it mirrors (link the MR), and the key facts pulled from the related diff (exact keys/options/shapes).
- **Scope** — the specific files to change and the existing pattern each edit follows. List representative paths, not every line.
- **Out of scope** — what is handled elsewhere (e.g. the backend/CLI already does X), so the plan stays minimal.
- **Verification** — how to type-check, lint, test, and exercise the change end-to-end. Use the repo's conventions (check `AGENTS.md`/`CLAUDE.md` and memory for the right build/lint/test commands and scoping flags).

## Tips

- The linked **CLI/backend MR is the source of truth** for names and option shapes; the Jira description is often vague. When they conflict, trust the merged diff.
- "Same options (if any) as the CLI" is a common acceptance criterion — answer it by reading the sibling diff, not by assuming.
- Don't enumerate every file/line in the plan; describe the repeated pattern once and give a few representative paths.
