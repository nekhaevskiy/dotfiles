# git bc-cherry-pick improved
gbcp() {
  local branch="${1:-}"
  git bc-show-eligible ${branch:+"$branch"} |
    fzf --no-sort --reverse |
    grep -o '^[a-f0-9]\{40\}' |
    xargs git bc-cherry-pick
}

# git worktree add - add an existing remote branch
gwa() {
  if ! git rev-parse --git-dir >/dev/null 2>&1; then
    echo "This is NOT a Git repository."
    return 1
  fi

  local -r branch="$1"
  if [ -z "$branch" ]; then
    echo "Usage: gwa <branch>"
    return 1
  fi

  if ! $(git rev-parse --is-bare-repository); then
    cd "$(git rev-parse --show-toplevel)"
    cd ..
  fi

  git fetch --prune
  git worktree add --track -b "$branch" "$branch" "origin/$branch"
  cd "$branch"
}

# git worktree add - create a new branch
gwab() {
  if ! git rev-parse --git-dir >/dev/null 2>&1; then
    echo "This is NOT a Git repository."
    return 1
  fi

  local -r new_branch="$1"
  if [ -z "$new_branch" ]; then
    echo "Usage: gwab <branch>"
    return 1
  fi

  local -r curr_branch=$(git branch --show-current)

  if ! $(git rev-parse --is-bare-repository); then
    cd "$(git rev-parse --git-common-dir)"
  fi

  git worktree add -b "$new_branch" "$new_branch" "$curr_branch"
  cd "$new_branch"
}

# rush update with git worktree hooks fix
rugw() {
  git config --unset core.hooksPath
  rush update
  rush lint-format-staged
  git config core.hooksPath "$(git rev-parse --git-dir)/hooks"
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
