# Preview hidden by default
_fzf_git_fzf() {
  fzf --height 50% --tmux 90%,70% \
    --layout reverse --multi --min-height 20+ --border \
    --no-separator --header-border horizontal \
    --border-label-pos 2 \
    --color 'label:blue' \
    --preview-window 'hidden' --preview-border line \
    --bind 'ctrl-/:change-preview-window(bottom,60%|right,50%|)' "$@"
}
