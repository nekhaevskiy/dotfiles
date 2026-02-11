---
name: mr-description
description: Generate a GitLab merge request description by comparing current branch with a base branch. Compare with main by default, or specify an alternative branch. Use when preparing MR descriptions or understanding what changed between branches.
argument-hint: '[base-branch]'
disable-model-invocation: true
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

1. **Extract Jira ticket from branch name**
   - Parse the current git branch name to find the ticket ID in `BCM-XXXXX` format
   - This will be used in both the "Tracked by" header and "Closes" footer

2. **Analyze git commits and file changes**
   - Compare current branch with the base branch using git commands
   - Read commit messages to understand what changed
   - Analyze file changes (added, modified, deleted files)
   - Look for patterns and the overall theme of changes

3. **Generate MR description following the exact structure below**

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

_Why did you add tests around the areas you did? If none, please mention why_

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

### How to test

- Provide **numbered step-by-step instructions**
- Make it easy for reviewers to verify the changes
- Include setup steps if needed (e.g., "Start dev server with `rushx start`")

### Test(s) added

- Explain **what tests were added** and **why those areas were chosen**
- If no tests were added, explain why
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

## Notes

- Replace placeholder text (lines starting with `_` underscores) with actual content based on the git analysis
- Replace `BCM-XXXXX` with the actual ticket ID extracted from the branch name
- Keep the template structure exactly as shown - do not skip sections
- Be specific and concrete - avoid vague statements
