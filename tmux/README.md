# tmux

## Commands

- `tmux list-sessions` - list the tmux sessions open
- `tmux attach-session -t <session_name>` - attach the session to a client
- `tmux new-session -s <session_name>` - create a new session
- `tmux kill-session` - kill the session
- `tmux kill-server` - kill the tmux server and every session
- `tmuxp load dotfiles` - start dotfiles session
- `tmuxp load frontend` - start frontend session

## Keymaps

- `<C-Space>` - tmux <prefix> key
- `<C-Space> ?` - list key bindings
- `<C-Space> r` - reload tmux config
- `<C-Space> |` - split window into panes vertically
- `<C-Space> -` - split window into panes horizontally
- `<C-h>` - focus pane to the left
- `<C-j>` - focus pane below
- `<C-k>` - focus pane above
- `<C-l>` - focus pane to the right
- `<A-h>` - go to the previous window
- `<A-l>` - go to the next window

### Copy mode

- `<C-Space> [` - go to the copy mode
- `q` - return back to the default mode (from the copy mode)
