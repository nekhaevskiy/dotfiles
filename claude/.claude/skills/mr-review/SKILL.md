---
name: mr-review
description: Perform a detailed code review by comparing current branch with a base branch. Compare with main by default, or specify an alternative branch. Use when the user asks to "review my changes", "review this MR", "review this merge request", "review this PR", "review this pull request", "review the diff", or "code review".
argument-hint: "[base-branch]"
disable-model-invocation: true
version: 2.0.0
---

# Merge Request Review

You are an expert software engineer and code reviewer with access to this local Git repository through tools.
Your job is to review the changes on my current branch compared to a base branch as if you were doing a detailed merge request review.

## Arguments

- No arguments: compare with `main` branch (default)
- One argument: compare with specified base branch name
  - Example: `/mr-review develop`
  - Example: `/mr-review base-branch-name`

The base branch is available as `$ARGUMENTS` or defaults to `main` if not provided.

## 1. Gather context

Use the available tools to:

- Identify the current branch.
- Run `git log [base-branch]...HEAD --oneline` to understand the commit history.
- Run `git diff [base-branch]...HEAD --stat` to see the scope of changes.

### Diff reading strategy for large changesets

- **Split diffs by directory/app**: Run separate `git diff [base-branch]...HEAD -- <path>` commands per top-level directory (e.g. `apps/foo/`, `packages/bar/`). This avoids truncation on large diffs.
- **Prioritize source over tests**: Read implementation files first to understand the design, then read tests to verify coverage.
- **Use parallel tool calls**: When reading diffs for independent directories, fetch them in parallel.
- **Inspect full files when needed**: If a diff is hard to understand in isolation, use the Read tool to view the full file for context.

## 2. Perform the review

Analyze all diffs thoroughly and then provide a structured review with these sections:

**Summary**: 3–6 bullet points describing what changed and why.

**Strengths**: What is done well (design, readability, tests, etc.).

**Issues / Risks**: Potential bugs, edge cases, security or performance problems, backwards-compatibility concerns, or smells. Categorize each issue by severity:

- **Critical**: Bugs, security vulnerabilities, data loss risks, or correctness problems that must be fixed before merge.
- **Medium**: Code smells, performance concerns, maintainability issues, or patterns that could cause problems later. Should be addressed but won't break things immediately.
- **Low**: Minor style issues, future-proofing suggestions, or edge cases that are unlikely to occur in practice.

**Suggested Improvements**: Concrete refactors, naming improvements, simplifications, or better patterns.

**Suggested Tests**: Additional unit/integration tests or scenarios that should be covered.

When mentioning issues or suggestions, reference files and line ranges so I can quickly navigate to them.
If something is unclear about the intent of the change, explicitly call that out as a question.

## 3. Save the review

After presenting the review to the user, automatically save it to `reference/` in the repository root:

- Filename format: `YYYY-MM-DD-mr-review-<short-description>.md`
- The `<short-description>` should be a kebab-case summary derived from the branch name or the review content (e.g. `config-parser`, `session-management`, `auth-refactor`).
- Include the branch name, date, and all review sections in the saved file.
- Do NOT commit the file — just write it to disk.
