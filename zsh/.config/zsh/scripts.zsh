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

# git branch fzf
gbf() {
    local -r git_branches="git branch --color --format=$'%(HEAD) %(color:yellow)%(refname:short)\t%(color:green)%(committerdate:short)\t%(color:blue)%(subject)' | column --table --separator=$'\t'"
    local -r get_selected_branch='echo {} | sed "s/^[* ]*//" | awk "{print \$1}"'
    local -r git_log="git log \$($get_selected_branch) --graph --color --format='%C(white)%h - %C(green)%cs - %C(blue)%s%C(red)%d'"
    local -r git_diff='git diff --color $(git branch --show-current)..$(echo {} | sed "s/^[* ]*//" | awk "{print \$1}")'
    local -r git_show_subshell=$(
        cat <<-EOF
		[[ \$($get_selected_branch) != '' ]] && sh -c "git show --color \$($get_selected_branch) | less -R"
	EOF
    )
    local -r header=$(
        cat <<-EOF
	> ALT-M to merge with current * branch | ALT-R to rebase with current * branch
	> ALT-C to checkout the branch
	> ALT-D to delete the merged local branch | ALT-X to force delete the local branch
	> ENTER to open the diff with less
	EOF
    )

    eval "$git_branches" |
        fzf \
            --ansi \
            --reverse \
            --no-sort \
            --preview-label '[ Commits ]' \
            --preview "$git_log" \
            --header-first \
            --header="$header" \
            --bind="alt-c:execute(git checkout \$($get_selected_branch))" \
            --bind="alt-c:+reload($git_branches)" \
            --bind="alt-m:execute(git merge \$($get_selected_branch))" \
            --bind="alt-r:execute(git rebase \$($get_selected_branch))" \
            --bind="alt-d:execute(git branch --delete \$($get_selected_branch))" \
            --bind="alt-d:+reload($git_branches)" \
            --bind="alt-x:execute(git branch --delete --force \$($get_selected_branch))" \
            --bind="alt-x:+reload($git_branches)" \
            --bind="enter:execute($git_show_subshell)" \
            --bind='ctrl-f:change-preview-label([ Diff ])' \
            --bind="ctrl-f:+change-preview($git_diff)" \
            --bind='ctrl-i:change-preview-label([ Commits ])' \
            --bind="ctrl-i:+change-preview($git_log)" \
            --bind='f1:toggle-header' \
            --bind='f2:toggle-preview' \
            --bind='ctrl-y:preview-up' \
            --bind='ctrl-e:preview-down' \
            --bind='ctrl-u:preview-half-page-up' \
            --bind='ctrl-d:preview-half-page-down'
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
        --bind='ctrl-y:preview-up' \
        --bind='ctrl-e:preview-down' \
        --bind='ctrl-u:preview-half-page-up' \
        --bind='ctrl-d:preview-half-page-down'
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
        cd "$(git rev-parse --show-toplevel)"
        cd ..
    fi

    git worktree add "$branch"
    cd "$branch"

    git fetch
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
        cd "$(git rev-parse --show-toplevel)"
        cd ..
    fi

    git worktree add -b "$branch" "$branch"
    cd "$branch"
}

# git worktree fzf
gwf() {
    #   local -r git_worktree_list='git worktree list'
    #
    #   local -r header=$(
    #       cat <<-EOF
    # > ALT-R to remove the worktree
    # > ALT-P to prune worktrees
    # > ENTER to checkout the worktree
    # EOF
    #   )

    #    local get_worktree
    #    read -r -d '' get_worktree <<-'EOF'
    # 	echo {} | awk "{print \$1}"
    # EOF

    # local -r git_worktree_remove="[[ \$($get_worktree) != '' ]] && git worktree remove \$($get_worktree)"

    cd $(eval "$git_worktree_list" |
        fzf \
            --reverse \
            --no-sort \
            --prompt="Git Worktree > " \
            awk "{print \$1}")
    # --header="$header" \
    # --header-first \
    # --bind="alt-r:execute($git_worktree_remove)" \
    # --bind="alt-r:+reload($git_worktree_list)" \
}

# rush update with git hooks fix
ru() {
    git config --unset core.hooksPath
    rush update
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
