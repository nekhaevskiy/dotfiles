---
name: yn-gitlab-mr-update
description: >
  Update GitLab merge request metadata — description, title, draft status, reviewers — via the
  GitLab API using curl. Use this skill whenever the user wants to edit an MR description, change
  an MR title, mark an MR as ready (un-draft), set a draft, add or change reviewers, or update
  any MR field. Also trigger when glab is unavailable or broken (e.g., snapd AppArmor errors) and
  the user needs to edit MR metadata. Prefer this over glab for any MR field update — glab doesn't
  expose a clean update command and curl is more reliable.
---

# GitLab MR Update

## Before starting, confirm you have

- **GitLab host** — e.g. `gitlab-master.nvidia.com`
- **Project path** — e.g. `bcm/cm/cm-setup`
- **MR IID** — the `!123` number visible in the URL (not the internal `id`)
- **What to update** — description, title, draft status, reviewers, or a combination

If any are missing from context, ask before proceeding.

---

## Get the auth token

```bash
GITLAB_TOKEN=$(glab config get token --host gitlab-master.nvidia.com 2>/dev/null)
```

If `glab` is broken (snapd AppArmor error, no output), fall back to reading the config file directly:

```bash
GITLAB_TOKEN=$(python3 -c "
import yaml, glob, os, sys

paths = (
    glob.glob(os.path.expanduser('~/.config/glab-cli/config.yml')) +
    sorted(glob.glob(os.path.expanduser('~/snap/glab/*/.config/glab-cli/config.yml')), reverse=True)
)
for p in paths:
    try:
        cfg = yaml.safe_load(open(p))
        hosts = cfg.get('hosts', {})
        for host, data in hosts.items():
            if 'gitlab-master.nvidia.com' in host:
                print(data.get('token', ''), end='')
                sys.exit(0)
    except Exception:
        pass
")
```

Change the host string in both snippets if the project is on a different GitLab instance.

---

## URL-encode the project path

Replace `/` with `%2F`:

```bash
ENCODED_PATH="bcm%2Fcm%2Fcm-setup"
```

For a dynamic approach:
```bash
ENCODED_PATH=$(python3 -c "import urllib.parse, sys; print(urllib.parse.quote(sys.argv[1], safe=''))" "bcm/cm/cm-setup")
```

---

## Update the MR

Use a single Python script to build the payload and make the request — avoids temp file issues with `$TMPDIR` in sandboxed environments:

```python
import json, subprocess

token = subprocess.check_output(
    ["glab", "config", "get", "token", "--host", "gitlab-master.nvidia.com"],
    stderr=subprocess.DEVNULL
).decode().strip()

payload = {
    "description": """Your new description here.

Multi-line is fine.""",
    # "title": "New title here",   # prefix with 'Draft: ' to draft, remove prefix to mark ready
    # "reviewer_ids": [16353, 67292],  # numeric IDs — look up via /api/v4/users?username=
}

result = subprocess.run([
    "curl", "-s", "-X", "PUT",
    "-H", f"PRIVATE-TOKEN: {token}",
    "-H", "Content-Type: application/json",
    "-d", json.dumps(payload),
    "https://gitlab-master.nvidia.com/api/v4/projects/ENCODED_PATH/merge_requests/IID"
], capture_output=True, text=True)

d = json.loads(result.stdout)
if "message" in d:
    print("ERROR:", d["message"])
else:
    print("title:", d.get("title"))
    print("draft:", d.get("draft"))
    print("desc preview:", d.get("description", "")[:120])
```

Save to a temp file and run with `python3 /path/to/script.py`, or use `python3 -c` with a heredoc for short payloads. Do **not** write the payload to `$TMPDIR` and pass with `curl -d @file` — `$TMPDIR` is unreliable in sandboxed environments.

### Common payload examples

**Description only:**
```json
{ "description": "..." }
```

**Title only:**
```json
{ "title": "Fix BCM-12345: short summary" }
```

**Mark ready (remove Draft):**

The `draft` field in the payload is **ignored by the API** — draft state is controlled exclusively
by the title prefix. To mark ready, remove `Draft: ` from the title:
```json
{ "title": "Fix BCM-12345: short summary" }
```

To mark as draft, add the prefix:
```json
{ "title": "Draft: Fix BCM-12345: short summary" }
```

**Add reviewers:**

Reviewers require numeric user IDs, not usernames. Look them up first:
```bash
for username in alice bob; do
  id=$(curl -s "https://gitlab-master.nvidia.com/api/v4/users?username=$username" \
    -H "PRIVATE-TOKEN: $GITLAB_TOKEN" \
    | python3 -c "import sys,json; u=json.load(sys.stdin); print(u[0]['id'] if u else 'NOT_FOUND')")
  echo "$username: $id"
done
```

Then set them in the payload (replaces existing reviewers):
```json
{ "reviewer_ids": [16353, 67292, 63378] }
```

**Multiple fields at once:**
```json
{ "title": "Fix BCM-12345: ...", "description": "...", "reviewer_ids": [16353, 67292] }
```

---

## Verify

The response JSON contains the full updated MR. Key fields to check:
- `title` — updated title (prefixed with `Draft: ` when `draft: true`)
- `draft` — boolean
- `description` — updated description
- `message` — present only on error (e.g., `"404 Not Found"`, `"401 Unauthorized"`)

If you get a 404, double-check the encoded project path and MR IID. If you get a 401, the token is wrong or expired.
