# save cluster IP
cips() {
  # Check if an argument is provided
  if [ -z "$1" ]; then
    echo "No cluster IP provided."
    return 1
  fi

  echo $1 > $HOME/work/scripts/cluster-ip
  echo "Cluster IP saved."
}

# load cluster IP
cipl() {
  export CLUSTER_IP=$(cat "$HOME/work/scripts/cluster-ip")
  echo "$CLUSTER_IP"
}
