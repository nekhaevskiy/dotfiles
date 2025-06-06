# cluster IP save
cips() {
  # Check if an argument is provided
  if [ -z "$1" ]; then
    echo "No cluster IP provided."
    return 1
  fi

  echo "$1" >"$HOME/work/cluster-ip"
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
