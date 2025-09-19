# git bc-cherry-pick
gbcp() {
  local branch="${1:-}"
  git bc-show-eligible ${branch:+"$branch"} |
    fzf --no-sort --reverse |
    grep -o '^[a-f0-9]\{40\}' |
    xargs git bc-cherry-pick
}

# git branch upstream
gbu() {
  local branch
  branch=$(git symbolic-ref --short HEAD)
  git branch --set-upstream-to=origin/$branch $branch
}

# git worktree fix 1
gwtf1() {
  # Explicitly sets the remote origin fetch so we can fetch remote branches
  git config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"
}

# git worktree fix 2
gwtf2() {
  ## Allow each worktree to maintain its own config
  git config extensions.worktreeConfig true
}

# git worktree fix 3
gwtf3() {
  ## has to be true in bare repo and fails in worktree
  git config --worktree core.bare "${1:-false}"
}

# git worktree hooks clear
gwhc() {
  git config --worktree --unset core.hooksPath
}

# git worktree hooks set
gwhs() {
  git config --worktree core.hooksPath "$(git rev-parse --git-dir)/hooks"
}

# feh fix
fehf() {
  feh --no-fehbg --bg-fill $HOME/Pictures/ubuntu-wallpaper-d.png
}

# rush update with git worktree hooks fix
rugw() {
  git config --worktree --unset core.hooksPath
  rush update
  git config --worktree core.hooksPath "$(git rev-parse --git-dir)/hooks"
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

title() {
  local title="$1"
  if [ -z "$title" ]; then
    echo "Usage: title <new-title>"
    return 1
  fi

  echo -e "\e]2;$title"
}
