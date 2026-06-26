---
name: yn-rush-lint-debug
description: Debug and fix lint errors in the bright-frontend repo. Use this skill whenever the user mentions lint failures, lint errors, ESLint warnings, or asks to fix/investigate/run lint in this project. Also trigger when `rush lint` fails or the user sees lint error output they need help with.
---

# Rush Lint Debug

This project uses Rush + ESLint. The default `rush lint` truncates output; always add `--verbose` to see all errors.

## Step 1: Get full output

```bash
rush lint --only <package> --verbose
```

> **Note:** `rush lint` writes a lock file to `~/.rush` — run it with sandbox disabled, otherwise you get a misleading `EROFS: read-only file system` error unrelated to your code.

Common packages: `base-view`, `customer-portal`, `user-portal`, etc. If the user is working in a specific app, use that package name. The package name matches the directory under `apps/`.

The `--verbose` flag causes Rush to print the full ESLint output inline rather than truncating it.

## Step 2: Parse the output

ESLint output format:
```
/path/to/File.tsx
  <line>:<col>  error    <message>  <rule-name>
  <line>:<col>  warning  <message>  <rule-name>
```

Group findings by rule name — it tells you exactly what to fix and how. The total at the bottom (`✖ N problems (X errors, Y warnings)`) shows scope. Notes at the bottom say how many are auto-fixable.

## Step 3: Diagnose by rule

### `@dword-design/import-alias/prefer-alias`
Parent imports (`../Foo`) that should use the `@/` path alias.

**Error example:**
```
Unexpected parent import '../Decoder.js'. Use '@/Components/Wizards/Containers/Kubernetes/Decoder.js' instead
```

The error message tells you the exact replacement. For bulk fixes across many files in the same directory, `sed` is the fastest approach:
```bash
find <dir> -name "*.tsx" | xargs sed -i "s|from '\.\./Decoder\.js'|from '@/path/to/Decoder.js'|g"
```

### `@typescript-eslint/no-unused-vars`
A variable is destructured or declared but never used in that function scope. Common pattern: a component destructures both `getNextOperatorIndex` and `getPrevOperatorIndex` from a hook, but only uses one.

**Fix:** Remove the unused name from the destructure. Don't rename it with `_` prefix — just remove it.

If the same pattern repeats across many files (e.g., two components per file, first uses one, second uses the other), a small Python script can fix all files at once rather than editing each manually.

### `react-hooks/exhaustive-deps`
A `useCallback` or `useEffect` dependency array is missing a value that's used inside.

**Fix:** Add the missing variable to the deps array. The error message names it: `React Hook useCallback has a missing dependency: 'foo'`.

### Other rules
For unfamiliar rules, the rule name itself (e.g., `@typescript-eslint/no-floating-promises`) is the best search term for what it checks and how to fix it.

## Step 4: Running ESLint on a specific directory

When you want to target a subdirectory rather than the whole package (faster, less noise):

```bash
PATH="/home/ynekhaevskiy/work/bright-frontend/common/autoinstallers/lint-format-tools/node_modules/.bin:$PATH" \
  LINT_PATH=/home/ynekhaevskiy/work/bright-frontend/apps/<package> \
  eslint \
  --config /home/ynekhaevskiy/work/bright-frontend/packages/bright-eslint-config/index.mjs \
  --no-warn-ignored \
  --max-warnings=0 \
  /path/to/target/directory
```

This is the same command Rush runs internally. Useful when you've fixed part of the codebase and want to confirm a specific area is clean before running the full lint.

## Lint passes when

`rush lint --only <package> --verbose` exits with no failures. Warnings also fail the build (`--max-warnings=0`), so all warnings must be fixed too, not just errors.
