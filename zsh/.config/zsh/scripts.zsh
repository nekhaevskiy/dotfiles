# cluster IP save
cips() {
  # Check if an argument is provided
  if [ -z "$1" ]; then
    echo "No cluster IP provided."
    return 1
  fi

  echo "$1" > "$HOME/work/cluster-ip"
  export CLUSTER_IP="$1"
  echo "$CLUSTER_IP" | xsel -ib
  echo "Cluster IP saved."
}

# cluster IP load
cipl() {
  export CLUSTER_IP=$(cat "$HOME/work/cluster-ip")
  echo "$CLUSTER_IP" | xsel -ib
  echo "$CLUSTER_IP"
}

# git bc-cherry-pick improved
gbcp() {
  local branch="$1"
  if [ -z "$branch" ]; then
    git bc-show-eligible | fzf --no-sort --reverse | grep -o '^[a-f0-9]\{40\}' | xargs git bc-cherry-pick
  else
    git bc-show-eligible "$branch" | fzf --no-sort --reverse | grep -o '^[a-f0-9]\{40\}' | xargs git bc-cherry-pick
  fi

}

# git worktree add <path/to/directory> <branch>
gwa() {
  local branch="$1"
  if [ -z "$branch" ]; then
    echo "Usage: gwa <branch>"
    return 1
  fi

  git worktree add "../$branch" "$branch"
  cd "$branch"
}

# git worktree add <path/to/directory> -b <branch>
gwab() {
  local branch="$1"
  if [ -z "$branch" ]; then
    echo "Usage: gwab <branch>"
    return 1
  fi

  git worktree add "../$branch" -b "$branch"
  cd "../$branch"
}

# remove a user-specified IP from the known_hosts file
sshr() {
    local ip="$1"
    if [ -z "$ip" ]; then
        echo "Usage: sshr <ip>"
        return 1
    fi

    ssh-keygen -f "$HOME/.ssh/known_hosts" -R "$ip"
    echo "IP $ip removed from known_hosts file."
}
