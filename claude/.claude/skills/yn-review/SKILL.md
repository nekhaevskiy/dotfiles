---
name: yn-review
description: Invoke this skill to review a GitLab merge request — checking code quality, finding bugs, and verifying the MR satisfies its linked Jira ticket. Trigger whenever the user asks to review, evaluate, look at, or check an MR: a full GitLab URL, a short reference like !735, an MR number, or a Jira ticket that maps to an MR. Also trigger for "is this ready to merge?", "does it cover the requirements?", or any request where the user wants a second set of eyes on an MR before it merges.
---

# GitLab MR Review

## Workflow

### Step 1: Parse the URL

From a GitLab MR URL like `https://gitlab-master.nvidia.com/bcm/cm/frontend/bright-frontend/-/merge_requests/735`, extract:
- `project_id` — the path between the host and `/-/merge_requests/` (e.g. `bcm/cm/frontend/bright-frontend`)
- `merge_request_iid` — the integer after `merge_requests/`

If only an MR number is given (no URL), ask which project or check `AGENTS.md` / recent git context for the repo's GitLab URL.

### Step 2: Fetch MR details

Call `gitlab_get_merge_request`. From the response extract:
- Jira ticket ID — look for `BCM-XXXXX` in the title or description (the MR description usually has "Tracked by BCM-XXXXX" or "Closes BCM-XXXXX")
- Existing reviewer comments (all reviewers including automated tools like CodeRabbit)

### Step 3: Parallel fetch — Jira ticket + diffs

Fire both at once:
- `jira_get_issue` with `full_text: true`, fields: `summary, description, status`
- `gitlab_get_merge_request_diffs`

### Step 4: Write the review

---

## Does it solve the ticket?

One-sentence verdict up front: **"Yes / Mostly / No — [reason]."**

Then a requirements table. Read the Jira ticket description carefully and extract each distinct requirement (not vague phrases — concrete behaviours, constraints, and out-of-scope calls). Map each to its status in the diff:

| Requirement | Status |
|---|---|
| What the ticket asked for | ✅ done / ⚠️ partial / ❌ missing |

Call out spec misses separately after the table — these are requirements the ticket explicitly states that the MR doesn't implement, or implements incorrectly.

## Bugs / issues

Concrete problems found in the diff. File:line references where possible. Group by severity:

- **Critical** — data loss, crashes, security holes, broken contracts
- **Bug** — incorrect behavior that will surface at runtime
- **Minor** — redundant casts, unnecessary re-renders, code smell

For each: what's wrong, why it matters, the fix if it's obvious.

## Open review threads

Summarize all reviewer comments — human and automated (CodeRabbit, bots). Group by reviewer. For each finding, note whether it's resolved or still open. Verify CodeRabbit findings against the actual diff before including them; skip any that are stale or no longer apply.

## Summary

2–3 sentences: overall verdict, what must change before merge, what's optional.

---

## Tips

- Fetch Jira and diffs **in parallel** (Step 3) — there's no dependency between them.
- The Jira ticket description is the source of truth for requirements. The MR description is secondary.
- Be specific. "JsonField.tsx:44 writes raw string to JsonValue-typed field" beats "there's a type issue".
- If no Jira ticket is linked, skip the ticket section and note it.
