# _fzf_git_files without file preview
_fzf_git_files() {
    _fzf_git_check || return
    local root query
    root=$(git rev-parse --show-toplevel)
    [[ $root != "$PWD" ]] && query='!../ '

    (
        git -c color.status=$(__fzf_git_color) status --short --no-branch
        git ls-files "$root" | grep -vxFf <(
            git status -s | grep '^[^?]' | cut -c4-
            echo :
        ) | sed 's/^/   /'
    ) |
        _fzf_git_fzf -m --ansi --nth 2..,.. \
            --border-label '📁 Files ' \
            --header 'CTRL-O (open in browser) ╱ ALT-E (open in editor)' \
            --bind "ctrl-o:execute-silent:bash \"$__fzf_git\" --list file {-1}" \
            --bind "alt-e:execute:${EDITOR:-vim} {-1} > /dev/tty" \
            --query "$query" \
            --preview "git diff --no-ext-diff --color=$(__fzf_git_color .) -- {-1} | $(__fzf_git_pager)" "$@" |
        cut -c4- | sed 's/.* -> //'
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
		> CTRL-T for status preview | CTRL-F for diff preview
		> ALT-E to open files in your editor
		> ALT-C to commit | ALT-A to append to the last commit
		EOF
    )

    local -r add_header=$(
        cat <<-EOF
		$header
		> ALT-P to add patch
		> ENTER to add files
		EOF
    )

    local -r reset_header=$(
        cat <<-EOF
		$header
		> ALT-D to reset and checkout files
		> ENTER to reset files
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
        --bind="ctrl-s:transform:[[ \$FZF_PROMPT =~ '$prompt_add' ]] && echo '$mode_reset' || echo '$mode_add'" \
        --bind="enter:execute($enter_cmd)" \
        --bind="enter:+reload([[ \$FZF_PROMPT =~ '$prompt_add' ]] && $git_unstaged_files || $git_staged_files)" \
        --bind="enter:+refresh-preview" \
        --bind='alt-p:execute(git add --patch {+})' \
        --bind="alt-p:+reload($git_unstaged_files)" \
        --bind="alt-d:execute($git_reset && git checkout {+})" \
        --bind="alt-d:+reload($git_staged_files)" \
        --bind='alt-c:execute(git commit)+abort' \
        --bind='alt-a:execute(git commit --amend)+abort' \
        --bind='alt-e:execute(${EDITOR:-nvim} {+})' \
        --bind='f1:toggle-header' \
        --bind='f2:toggle-preview' \
        --bind='ctrl-u:preview-up' \
        --bind='ctrl-d:preview-down'
}

# git bc-cherry-pick improved
gbcp() {
    local branch="${1:-}"
    git bc-show-eligible ${branch:+"$branch"} |
        fzf --no-sort --reverse |
        grep -o '^[a-f0-9]\{40\}' |
        xargs git bc-cherry-pick
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

    # Fix fetch settings
    git config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"
}

# git log fzf
glf() {
    local -r git_log=$(
        cat <<-EOF
		git log --graph --color --format="%C(white)%h - %C(green)%cs - %C(blue)%s%C(red)%d"
	EOF
    )

    local -r git_log_all=$(
        cat <<-EOF
		git log --all --graph --color --format="%C(white)%h - %C(green)%cs - %C(blue)%s%C(red)%d"
	EOF
    )

    local get_hash
    read -r -d '' get_hash <<-'EOF'
		echo {} | grep -o "[a-f0-9]\{7\}" | sed -n "1p"
	EOF

    local -r git_show="[[ \$($get_hash) != '' ]] && git show --color \$($get_hash)"
    local -r git_show_subshell=$(
        cat <<-EOF
		[[ \$($get_hash) != '' ]] && sh -c "git show --color \$($get_hash) | less -R"
	EOF
    )

    local -r git_checkout="[[ \$($get_hash) != '' ]] && git checkout \$($get_hash)"
    local -r git_reset="[[ \$($get_hash) != '' ]] && git reset \$($get_hash)"
    local -r git_rebase_interactive="[[ \$($get_hash) != '' ]] && git rebase --interactive \$($get_hash)"
    local -r git_cherry_pick="[[ \$($get_hash) != '' ]] && git cherry-pick \$($get_hash)"

    local -r header=$(
        cat <<-EOF
		> ENTER to display the diff with less
	EOF
    )

    local -r header_branch=$(
        cat <<-EOF
		$header
		> CTRL-S to switch to All Commits mode
		> ALT-C to checkout the commit | ALT-R to reset to the commit
		> ALT-I to rebase interactively until the commit
	EOF
    )

    local -r header_all=$(
        cat <<-EOF
		$header
		> CTRL-S to switch to Branch Commits mode
		> ALT-P to cherry pick
	EOF
    )

    local -r branch_prompt='Branch > '
    local -r all_prompt='All > '

    local -r mode_all="change-prompt($all_prompt)+reload($git_log_all)+change-header($header_all)+unbind(alt-c)+unbind(alt-r)+unbind(alt-i)+rebind(alt-p)"
    local -r mode_branch="change-prompt($branch_prompt)+reload($git_log)+change-header($header_branch)+rebind(alt-c)+rebind(alt-r)+rebind(alt-i)+unbind(alt-p)"

    eval "$git_log" | fzf \
        --ansi \
        --reverse \
        --no-sort \
        --prompt="$branch_prompt" \
        --header-first \
        --header="$header_branch" \
        --preview="$git_show" \
        --bind='start:unbind(alt-p)' \
        --bind="ctrl-s:transform:[[ \$FZF_PROMPT =~ '$branch_prompt' ]] && echo '$mode_all' || echo '$mode_branch'" \
        --bind="enter:execute($git_show_subshell)" \
        --bind="alt-c:execute($git_checkout)+abort" \
        --bind="alt-r:execute($git_reset)+abort" \
        --bind="alt-i:execute($git_rebase_interactive)+abort" \
        --bind="alt-p:execute($git_cherry_pick)+abort" \
        --bind='f1:toggle-header' \
        --bind='f2:toggle-preview' \
        --bind='ctrl-u:preview-up' \
        --bind='ctrl-d:preview-down'
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

# rush update with git hooks fix
ru() {
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

# tmuxp load session
tls() {
    local -r session=$(
        ls -1 $HOME/.config/tmuxp | sed 's/\.yml$//' | fzf --height=50% --tmux 90%,70% \
            --layout=reverse --min-height=20 --border \
            --border-label-pos=2 \
            --border-label 'tmux sessions ' \
            --color='label:blue'
    )

    [[ -n $session ]] && tmuxp load $session
}
