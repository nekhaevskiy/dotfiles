---
name: yn-create-jira-ticket
description: Create a Jira ticket from the current conversation context. Use this skill whenever the user says "create a Jira ticket", "file a ticket", "open a ticket", "add to Jira", "make a Jira issue", or any similar phrase. Also trigger when the user finishes investigating a bug or designing a feature and wants to track it — even if they don't say "Jira" explicitly.
---

## Defaults

- **Project key**: `BCM`
- **Issue type**: ask the user (common values: `Bug`, `Task`, `Story`, `Improvement`)
- **Priority**: `High`
- **Assignee**: unset

## Workflow

### 1. Gather project conventions

**If the user provides an example ticket URL:**
- Fetch the ticket with `jira_get_issue`, requesting fields: `summary`, `issuetype`, `priority`, `labels`, `fixVersions`, `components`
- Note the project key, issue type used, priority name, labels, fix versions — these are the conventions to follow

**If no example ticket:**
- Use the defaults above
- Still call `jira_get_editmeta` on a recent known ticket in the target project to validate that `High` is a valid priority name. If `High` is not in the allowed values, pick the closest available (e.g., `Highest` or `Critical` if they exist, otherwise the next lower one)

### 2. Extract ticket content from the conversation

Read back through the conversation and extract:
- **Summary**: a concise one-line title (under 70 chars), starting with the component name if clear (e.g., `cm-setup: ...`, `base-view: ...`)
- **Problem**: what's broken or missing, and why it matters
- **Root cause**: if investigated and known (include as `h2. Root cause` when present — it's valuable context for the assignee)
- **Proposed solution**: concrete steps, file paths, code snippets in `{code:python}` / `{code:json}` blocks
- **Consumer**: who or what will use this (another component, ticket, team)

Use Jira wiki markup throughout the description:
- `h2.` for section headers
- `{{monospace}}` for inline code, file paths, function names
- `{code:python}` / `{code:json}` for code blocks
- `*bold*` sparingly

### 3. Show the full draft for approval

Present the complete ticket — summary and full description — to the user **before creating it**. The Jira API does not allow description updates after creation, so getting this right upfront matters.

Format the preview clearly:

```
**Summary:** <summary>

**Description:**
<full description>

**Issue type:** Task  |  **Priority:** High  |  **Labels:** [...]  |  **Fix version:** [...]
```

Ask: "Does this look right? Any changes before I create it?" Then wait for the user's go-ahead before calling the API. Apply any edits they request.

### 4. Create the ticket

Call `jira_create_issue` with the approved content. Do not set `assignee_account_id`.

If a validation error occurs on `priority`:
- Call `jira_get_editmeta` on any issue in the same project
- Pick the closest valid priority to `High`
- Retry once

### 5. Confirm

Return the created issue key and URL:
```
Created: BCM-XXXXX — https://jirasw.nvidia.com/browse/BCM-XXXXX
```

If the user wants to change the summary or other editable fields afterwards, use `jira_update_issue`.
