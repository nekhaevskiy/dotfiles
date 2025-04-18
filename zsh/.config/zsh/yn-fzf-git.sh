# Preview at the bottom
_fzf_git_fzf() {
        fzf --height 50% --tmux 90%,70% \
                --layout reverse --multi --min-height 20+ --border \
                --no-separator --header-border horizontal \
                --border-label-pos 2 \
                --color 'label:blue' \
                --preview-window 'bottom,60%' --preview-border line \
                --bind 'ctrl-/:change-preview-window(right,50%|hidden|)' "$@"
}

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
                        --bind "alt-e:execute:${EDITOR:-nvim} {-1} > /dev/tty" \
                        --query "$query" \
                        --preview "git diff --no-ext-diff --color=$(__fzf_git_color .) -- {-1} | $(__fzf_git_pager)" "$@" |
                cut -c4- | sed 's/.* -> //'
}
