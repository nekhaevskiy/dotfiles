---
name: yn-gitlab-mr-comment
description: >
  Post comments and discussions on GitLab merge requests — inline diff notes pinned to a
  specific file and line, general MR discussions (resolvable threads not tied to a line),
  or replies to existing discussion threads. Use this skill whenever the user wants to
  leave a review comment on a GitLab MR, post an inline comment on a diff, start a
  discussion thread, reply to an existing thread, or delete a note. Also trigger when a
  previous comment attempt landed as a general comment instead of inline (the glab CLI
  silently drops position data — this skill uses curl to work around that).
---

# GitLab MR Comment

## Before starting, confirm you have

- **GitLab host** — e.g. `gitlab-master.nvidia.com`
- **Project path** — e.g. `bcm/cm/frontend/bright-frontend`
- **MR IID** — the `!123` number (not the internal `id`)
- **Comment type** — inline diff note, general discussion, or reply to existing thread
- For **inline**: file path, target line number (and whether it's an added or removed line)
- For **reply**: the discussion ID to reply to
- **Comment body** — the text to post

If any of these are missing, ask before proceeding.

---

## Why `glab` doesn't work for inline comments

`glab mr note` only posts to `/notes` — no position support, always a general comment.
`glab api -f "position[new_line]=N"` silently drops the nested position object and falls
back to a general comment. `glab api --input <file>` silently ignores the file (glab bug).

**The only working path is curl with `-d @<tmpfile>`.**

## Get the auth token

```bash
GITLAB_TOKEN=$(glab config get token --host gitlab-master.nvidia.com)
```

If the project is on a different host, change the `--host` value accordingly.

## Get the MR's diff refs (needed for inline and discussion notes)

```bash
glab api "projects/<encoded-project-path>/merge_requests/<iid>" \
  | python3 -c "import sys,json; d=json.load(sys.stdin); print(json.dumps(d['diff_refs'], indent=2))"
```

URL-encode the project path: replace `/` with `%2F` (e.g. `bcm%2Fcm%2Ffrontend%2Fbright-frontend`).

This returns:
```json
{
  "base_sha": "...",
  "start_sha": "...",
  "head_sha": "..."
}
```

## Find the exact line number

For an **added line** (`+` in the diff), you want `new_line`. Confirm by checking the file
at `head_sha`:

```bash
git show <head_sha>:<path/to/file> | grep -n "the text you're targeting"
```

For a **removed line** (`-` in the diff), use `old_line` instead of `new_line`, and check
the file at `base_sha`.

---

## 1. Inline diff note (pinned to file:line)

Creates a resolvable discussion thread anchored to a specific line in the diff.

**Important: write the payload with the Write tool, not with `python3 -c` or heredocs.**
Inline Python breaks as soon as comment bodies contain quotes or apostrophes.
`$TMPDIR` is often unset in the sandbox — always use `/tmp/claude/` directly.

**Step 1 — write the payload file** (use the Write tool):

```python
# /tmp/claude/mr_comment.py
import json

base  = "<base_sha>"
head  = "<head_sha>"

payload = {
    "body": (
        "Your comment here.\n\n"
        "Multi-line is fine — build the string in Python to avoid shell quoting issues."
    ),
    "position": {
        "base_sha":  base,
        "start_sha": base,
        "head_sha":  head,
        "position_type": "text",
        "new_path": "path/to/file.ext",
        "old_path": "path/to/file.ext",
        "new_line": 163       # use old_line for removed lines
    }
}

with open("/tmp/claude/mr_comment.json", "w") as f:
    json.dump(payload, f)
print("written")
```

**Step 2 — run the script and post:**

```bash
python3 /tmp/claude/mr_comment.py

GITLAB_TOKEN=$(glab config get token --host gitlab-master.nvidia.com)

curl -s -X POST \
  -H "PRIVATE-TOKEN: $GITLAB_TOKEN" \
  -H "Content-Type: application/json" \
  -d @/tmp/claude/mr_comment.json \
  "https://gitlab-master.nvidia.com/api/v4/projects/<encoded-path>/merge_requests/<iid>/discussions" \
  | python3 -c "
import sys, json
d = json.load(sys.stdin)
notes = d.get('notes', [])
if notes:
    print('type:', notes[0].get('type'))
    print('line:', notes[0].get('position', {}).get('new_line') or notes[0].get('position', {}).get('old_line'))
else:
    print(json.dumps(d, indent=2)[:400])
"
```

Verify the response shows `type: DiffNote` — if it shows `DiscussionNote` with `position: null`,
the position was dropped (wrong SHAs or line number).

**Posting multiple comments:** write one `.py` script that generates all payload files, run it
once, then loop over the files with curl. See the pattern used in practice:

```bash
for i in 1 2 3 4; do
  curl -s -X POST \
    -H "PRIVATE-TOKEN: $GITLAB_TOKEN" \
    -H "Content-Type: application/json" \
    -d @/tmp/claude/c${i}.json \
    "$BASE_URL" \
    | python3 -c "..."
done
```

---

## 2. General MR discussion (resolvable thread, not tied to a line)

Different from `glab mr note`: this creates a **resolvable** thread on the MR overview.

```bash
GITLAB_TOKEN=$(glab config get token --host gitlab-master.nvidia.com)

curl -s -X POST \
  -H "PRIVATE-TOKEN: $GITLAB_TOKEN" \
  -H "Content-Type: application/json" \
  -d "{\"body\": \"Your comment here.\"}" \
  "https://gitlab-master.nvidia.com/api/v4/projects/<encoded-path>/merge_requests/<iid>/discussions" \
  | python3 -c "import sys,json; d=json.load(sys.stdin); print('discussion id:', d.get('id'))"
```

---

## 3. Reply to an existing discussion thread

First get the discussion ID (from the initial note response, or by listing discussions):

```bash
glab api "projects/<encoded-path>/merge_requests/<iid>/discussions" \
  | python3 -c "
import sys, json
for d in json.load(sys.stdin):
    for n in d.get('notes', []):
        print(d['id'], '|', n.get('author',{}).get('username'), '|', n['body'][:80])
"
```

Then reply — **always use the file-based payload approach**, even for simple replies. The
inline `-d "{...}"` form breaks silently when the body contains backticks (shell interprets
them as command substitution) or other special characters.

**Step 1 — write the payload** (use the Write tool):

```python
# /tmp/claude/mr_reply.py
import json

payload = {"body": "Your reply here — backticks like `this` are safe in Python strings."}

with open("/tmp/claude/mr_reply.json", "w") as f:
    json.dump(payload, f)
print("written")
```

**Step 2 — run and post:**

```bash
python3 /tmp/claude/mr_reply.py

GITLAB_TOKEN=$(glab config get token --host gitlab-master.nvidia.com)

curl -s -X POST \
  -H "PRIVATE-TOKEN: $GITLAB_TOKEN" \
  -H "Content-Type: application/json" \
  -d @/tmp/claude/mr_reply.json \
  "https://gitlab-master.nvidia.com/api/v4/projects/<encoded-path>/merge_requests/<iid>/discussions/<discussion_id>/notes" \
  | python3 -c "import sys,json; d=json.load(sys.stdin); print('note id:', d.get('id'))"
```

---

## 4. Delete a note

```bash
GITLAB_TOKEN=$(glab config get token --host gitlab-master.nvidia.com)

curl -s -X DELETE \
  -H "PRIVATE-TOKEN: $GITLAB_TOKEN" \
  "https://gitlab-master.nvidia.com/api/v4/projects/<encoded-path>/merge_requests/<iid>/notes/<note_id>"
echo "exit: $?"
```

Note IDs come from the note objects returned when posting or from listing discussions.
