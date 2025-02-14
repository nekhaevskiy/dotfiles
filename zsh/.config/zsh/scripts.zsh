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

# git add fzf
gaf() {
    local -r prompt_add="Add > "
    local -r prompt_reset="Reset > "

    local -r git_root_dir=$(git rev-parse --show-toplevel)
    local -r git_unstaged_files="git ls-files --modified --deleted --other --exclude-standard --deduplicate $git_root_dir"

    local -r git_staged_files='git status --short | grep "^[A-Z]" | awk "{print \$NF}"'

    local -r git_reset="git reset -- {+}"
    local -r enter_cmd="($git_unstaged_files | grep {} && git add {+}) || $git_reset"

    local -r git_diff_unstaged='git diff --color=always {} | sed "1,4d"'
    local -r git_diff_staged='git diff --staged --color=always {} | sed "1,4d"'

    local -r preview_status_label="[ Diff ]"
    local -r preview_status="($git_unstaged_files | grep {} && $git_diff_unstaged) || $git_diff_staged"

    local -r header=$(
        cat <<-EOF
		> CTRL-S to switch between Add Mode and Reset mode
		> CTRL-T for status preview | CTRL-F for diff preview | CTRL-B for blame preview
		> ALT-E to open files in your editor
		EOF
    )

    local -r add_header=$(
        cat <<-EOF
		$header
		> ENTER to add files
		> ALT-P to add patch
		EOF
    )

    local -r reset_header=$(
        cat <<-EOF
		$header
		> ENTER to reset files
		> ALT-D to reset and checkout files
		EOF
    )

    local -r mode_reset="change-prompt($prompt_reset)+reload($git_staged_files)+change-header($reset_header)+unbind(alt-p)+rebind(alt-d)"
    local -r mode_add="change-prompt($prompt_add)+reload($git_unstaged_files)+change-header($add_header)+rebind(alt-p)+unbind(alt-d)"

    eval "$git_unstaged_files" | fzf \
        --multi \
        --reverse \
        --no-sort \
        --prompt="Add > " \
        --preview-label="$preview_status_label" \
        --preview="$preview_status" \
        --header "$add_header" \
        --header-first \
        --bind='start:unbind(alt-d)' \
        --bind="ctrl-t:change-preview-label([ Status ])" \
        --bind="ctrl-t:+change-preview(git status --short)" \
        --bind="ctrl-f:change-preview-label($preview_status_label)" \
        --bind="ctrl-f:+change-preview($preview_status)" \
        --bind='ctrl-b:change-preview-label([ Blame ])' \
        --bind='ctrl-b:+change-preview(git blame --color-by-age {})' \
        --bind="ctrl-s:transform:[[ \$FZF_PROMPT =~ '$prompt_add' ]] && echo '$mode_reset' || echo '$mode_add'" \
        --bind="enter:execute($enter_cmd)" \
        --bind="enter:+reload([[ \$FZF_PROMPT =~ '$prompt_add' ]] && $git_unstaged_files || $git_staged_files)" \
        --bind="enter:+refresh-preview" \
        --bind='alt-p:execute(git add --patch {+})' \
        --bind="alt-p:+reload($git_unstaged_files)" \
        --bind="alt-d:execute($git_reset && git checkout {+})" \
        --bind="alt-d:+reload($git_staged_files)" \
        --bind='alt-e:execute(${EDITOR:-vim} {+})' \
        --bind='f1:toggle-header' \
        --bind='f2:toggle-preview' \
        --bind='ctrl-y:preview-up' \
        --bind='ctrl-e:preview-down' \
        --bind='ctrl-u:preview-half-page-up' \
        --bind='ctrl-d:preview-half-page-down'
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

# git clone --bare
gclb() {
    local repo="$1"
    local dir="$2"

    if [ -z "$repo" ] || [ -z "$dir" ]; then
        echo "Usage: gclb <repo> <path-to-directory>"
        return 1
    fi

    # Clone the repo as a bare repository
    if ! git clone --bare "$repo" "$dir"; then
        echo "Error: Failed to clone repository."
        return 1
    fi

    cd "$dir"

    # Configure fetch settings inside the cloned repo
    git config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"
}

# git worktree add - add an existing remote branch
gwa() {
    if ! git rev-parse --git-dir >/dev/null 2>&1; then
        echo "This is NOT a Git repository."
        return 1
    fi

    local branch="$1"
    if [ -z "$branch" ]; then
        echo "Usage: gwa <branch>"
        return 1
    fi

    if ! $(git rev-parse --is-bare-repository); then
        echo 2
        cd "$(git rev-parse --show-toplevel)"
        cd ..
    fi

    git worktree add "$branch"
    cd "$branch"
    git fetch --all
    git branch --set-upstream-to origin/"$branch"
}

# git worktree add - create a new branch
gwab() {
    if ! git rev-parse --git-dir >/dev/null 2>&1; then
        echo "This is NOT a Git repository."
        return 1
    fi

    local branch="$1"
    if [ -z "$branch" ]; then
        echo "Usage: gwab <branch>"
        return 1
    fi

    if ! $(git rev-parse --is-bare-repository); then
        echo 2
        cd "$(git rev-parse --show-toplevel)"
        cd ..
    fi

    git worktree add -b "$branch" "$branch"
    cd "$branch"
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
