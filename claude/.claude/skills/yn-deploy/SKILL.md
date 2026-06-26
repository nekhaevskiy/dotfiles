---
name: yn-deploy
description: >
  Deploy a bright-frontend app (base-view, user-portal, cm-jupyterlab-extensions) to a cluster
  node via SSH. Use this skill whenever the user says "deploy", "push to", "ship to", or gives a
  cluster IP with an MR URL, MR number, or branch name — even if they just say something like
  "deploy MR 735 to 10.64.194.238". Handles token retrieval, SSH trust, and runs the right
  deploy script automatically.
---

# Deploy bright-frontend to a cluster

## Parse the request

Extract from the user's message:

- **Source**: MR URL (e.g. `.../merge_requests/735`), MR number (`!735` or `735`), or branch name
- **Cluster IP**: the target host
- **App** (optional, default `base-view`): `base-view` | `user-portal` | `cm-jupyterlab-extensions`
- **Mode** (optional, default dev): `--prod` flag for production bundle (base-view only)

If source is an MR URL, extract the numeric ID from the end of the path.

If the app isn't specified, default to `base-view` and mention it.

## Get the GitLab token

```bash
GITLAB_TOKEN=$(glab config get token --host gitlab-master.nvidia.com 2>/dev/null)
```

If that returns empty, fall back to reading the config file:

```python
import yaml, glob, os, sys
paths = (
    glob.glob(os.path.expanduser('~/.config/glab-cli/config.yml')) +
    sorted(glob.glob(os.path.expanduser('~/snap/glab/*/.config/glab-cli/config.yml')), reverse=True)
)
for p in paths:
    try:
        cfg = yaml.safe_load(open(p))
        for host, data in cfg.get('hosts', {}).items():
            if 'gitlab-master.nvidia.com' in host:
                print(data.get('token', ''), end='')
                sys.exit(0)
    except Exception:
        pass
```

## Ensure SSH trust

Before deploying, make sure the cluster host key is trusted — otherwise SSH will hang waiting for
interactive input. Run with sandbox disabled since it touches `~/.ssh/known_hosts`:

```bash
ssh-keyscan -H <CLUSTER_IP> >> ~/.ssh/known_hosts 2>/dev/null
```

This is idempotent (safe to re-run).

## Run the deploy script

From the bright-frontend repo root. Always run with sandbox disabled (SSH + `~/.ssh`).

**From an MR:**
```bash
GITLAB_TOKEN=<token> bash scripts/deploy-from-mr.sh <APP> <CLUSTER_IP> <MR_ID> [--prod]
```

**From a branch:**
```bash
GITLAB_TOKEN=<token> bash scripts/deploy-from-branch.sh <APP> <CLUSTER_IP> [BRANCH] [--prod]
```

Branch defaults to `main` if omitted.

## Report result

The script prints the URL on success, e.g. `Successfully deployed at https://<IP>:8081/base-view/`.
Pass that URL back to the user.

If the CI pipeline hasn't finished yet, the artifact download will fail with a 404 — tell the user
to wait for the pipeline and retry.
