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
  if [ -z "$1" ]; then
    echo "No branch provided."
    return 1
  fi

  git bc-show-eligible "$1" | fzf --no-sort --reverse | grep -o '^[a-f0-9]\{40\}' | xargs git bc-cherry-pick
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
