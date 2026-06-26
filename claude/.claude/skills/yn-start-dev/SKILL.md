---
name: yn-start-dev
description: Start or stop the local development server for bright-frontend apps against a real BCM
  cluster. Sets up SSH tunnel, runs rush update + rebuild, and launches the dev server. Use whenever
  the user wants to start development, run the app locally, launch base-view or user-portal or
  cm-jupyterlab-extensions, test changes against a cluster, asks how to bring up the dev environment,
  or wants to stop the dev server / tunnel.
---

# Start/Stop Local Development Server

## Parse the request

Determine the **action**: start or stop.

For **start**, extract:
- **App**: `base-view` (default), `user-portal`, or `cm-jupyterlab-extensions`
- **Cluster IP**: required — ask if not provided

---

## Starting

### 1. SSH tunnel

Run with sandbox disabled (touches `~/.ssh`). Ensure the host key is trusted, then open the tunnel in the background:

```bash
ssh-keyscan -H <IP> >> ~/.ssh/known_hosts 2>/dev/null
ssh -L 8081:0:8081 -L 3040:0:3040 root@<IP> -N &
```

Ports by app:

| App | Ports |
|-----|-------|
| `base-view` | 8081 (always), 3040 (Grafana panels) |
| `user-portal` | 8081 |
| `cm-jupyterlab-extensions` | 8081, 8000 |

### 2. Update dependencies

Always run — switching branches can leave stale packages from a previous branch:

```bash
rush update
```

### 3. Rebuild

```bash
rush rebuild --to <app>
```

### 4. Start dev server

Run in the background so the conversation stays live:

```bash
cd apps/<app> && rushx start
```

### 5. Report back

Tell the user:
- Dev server URL — usually `http://localhost:3000/<app>/`
- That they can ask you to stop the dev server and tunnel when done

---

## Stopping

Kill the SSH tunnel and the dev server background job:

```bash
# Kill SSH tunnel
pkill -f "ssh -L 8081"

# Kill dev server (vite)
pkill -f "vite"
```

Run with sandbox disabled. Confirm to the user that both are stopped.
