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

# cluster IP save
cips() {
  # Check if an argument is provided
  if [ -z "$1" ]; then
    echo "No cluster IP provided."
    return 1
  fi

  echo "$1" >"$HOME/work/cluster-ip"
  export CLUSTER_IP="$1"
  echo "$CLUSTER_IP" | wl-copy
  echo "Cluster IP saved."
}

# cluster IP load
cipl() {
  export CLUSTER_IP=$(cat "$HOME/work/cluster-ip")
  echo "$CLUSTER_IP" | wl-copy
  echo "$CLUSTER_IP"
}
