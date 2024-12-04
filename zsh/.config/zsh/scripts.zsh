# save cluster IP
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

# load cluster IP
cipl() {
  export CLUSTER_IP=$(cat "$HOME/work/cluster-ip")
  echo "$CLUSTER_IP" | xsel -ib
  echo "$CLUSTER_IP"
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
