---
name: mr-description
description: Generate a GitLab merge request description by comparing current branch with a base branch. Compare with main by default, or specify an alternative branch. Use when preparing MR descriptions or understanding what changed between branches.
argument-hint: "[base-branch]"
disable-model-invocation: true
version: 2.0.0
---

Generate a GitLab merge request description for the current branch by comparing against a base branch.

## Arguments

- No arguments: compare with `main` branch (default)
- One argument: compare with specified base branch name
  - Example: `/mr-description develop`
  - Example: `/mr-description base-branch-name`

The base branch is available as `$ARGUMENTS` or defaults to `main` if not provided.

## Workflow

Follow these steps to generate the MR description:

### 1. Extract Jira ticket from branch name

- Parse the current git branch name to find the ticket ID in `BCM-XXXXX` format
- This will be used in both the "Tracked by" header and "Closes" footer

### 2. Analyze git commits and file changes

- Run `git log [base-branch]...HEAD --oneline` to understand the commit history.
- Run `git diff [base-branch]...HEAD --stat` to see the scope of changes.

**Diff reading strategy for large changesets:**

- **Split diffs by directory/app**: Run separate `git diff [base-branch]...HEAD -- <path>` commands per top-level directory (e.g. `apps/foo/`, `packages/bar/`). This avoids truncation on large diffs.
- **Prioritize source over tests**: Read implementation files first to understand the design, then read tests to verify coverage.
- **Use parallel tool calls**: When reading diffs for independent directories, fetch them in parallel.
- **Inspect full files when needed**: If a diff is hard to understand in isolation, use the Read tool to view the full file for context.

### 3. Check reference/ for planning context

- Look for `reference/` files in the repository root that relate to the current branch or ticket.
- Planning docs, architecture decisions, and phase summaries can inform the "Considerations and implementation" section.
- Do NOT quote or reference internal planning terminology (phase numbers, task IDs) in the output — describe actual changes.

### 4. Generate MR description following the exact structure below

## MR Description Template

Generate the description following this **exact structure**:

```
Tracked by BCM-XXXXX

## Notable changes

_Explain the value of the PR in a sentence or a few bullet points._

## Considerations and implementation

_What technical details should the team pay particular attention to? What unexpected issues did you encounter?_

### How to test

1. _How can others test your changes?_

### Test(s) added

_List specific test files and what they cover._

### Screenshots

| Before | After |
| ------ | ----- |
| _screenshot_before_ | _screenshot_after_ |

Closes BCM-XXXXX
```

## Content Guidelines for Each Section

### Notable changes

- Summarize the **value and purpose** from commit messages
- Use bullet points for multiple changes
- Focus on what changed and why it matters

### Considerations and implementation

- Highlight **technical decisions** and architecture changes
- Explain **edge cases handled** during implementation
- Document **unexpected issues encountered** and how they were resolved
- Call out areas that need particular attention during review
- Draw on `reference/` planning docs for context if available

### How to test

- This project has a GitLab CI pipeline that runs build, tests, and lint. For non-visual changes, "Green pipeline" is sufficient.
- For visual or interactive changes, add manual testing steps (e.g., "Start dev server with `rushx start`", navigate to a specific page, verify behavior).

### Test(s) added

List specific test files that were added or modified, with a brief description of what each covers:

```
- `BundleFS.test.ts` — ZIP/YAML bundle detection, build-config.xml conflict checks
- `Migrate.test.ts` — Default application, partial config merging, version routing
- `ConfigureRemoteModal.test.tsx` — Form validation, DHCP/static toggle, API integration
```

If no tests were added, explain why:

- Examples: "Refactor only, existing tests cover this", "Visual changes only, tested manually"

### Screenshots

- Use the Before/After table format
- Write **"N/A"** if the change is not visual (backend, refactoring, configuration, etc.)
- For visual changes, indicate where screenshots should be added or note that screenshots will be added

## Output Format Requirements

**IMPORTANT**: Output the complete MR description inside a **single markdown code block** so it can be easily copied with the copy button.

Example:

````markdown
```markdown
Tracked by BCM-12345

## Notable changes

- Added new feature X
- Fixed bug in Y

...
```
````

## Save the description

After presenting the description to the user, automatically save it to `reference/` in the repository root:

- Filename format: `YYYY-MM-DD-mr-description-<short-description>.md`
- The `<short-description>` should be a kebab-case summary derived from the branch name or the MR content.
- Include the branch name, date, and the full MR description in the saved file.
- Do NOT commit the file — just write it to disk.

## Notes

- Replace placeholder text (lines starting with `_` underscores) with actual content based on the git analysis
- Replace `BCM-XXXXX` with the actual ticket ID extracted from the branch name
- Keep the template structure exactly as shown - do not skip sections
- Be specific and concrete - avoid vague statements
