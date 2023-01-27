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

- `<C-Space>` - tmux prefix key
- `<prefix> :` - open command prompt
- `<prefix> r` - reload tmux config
- `<prefix> v` - split window vertically
- `<prefix> h` - split window horizontally
- `<prefix> <A-<arrow_key>>` - resize a pane
- `<C-h>` - focus pane to the left
- `<C-j>` - focus pane below
- `<C-k>` - focus pane above
- `<C-l>` - focus pane to the right
- `<prefix> n` - rename the current window
- `<prefix> w` - create a new window
- `<prefix> <number>` - go to the window <number>
- `<A-j>` - go to the previous window
- `<A-k>` - go to the next window
- `<prefix> $` - rename the current session
- `<prefix> &` - kill the current window
- `<prefix> ?` - list all key bindings

### Copy mode

- `<prefix> [` - go to the copy mode
- `q` - return back to the default mode (from the copy mode)
- `v` - begin the selection of the text
- `y` - yank the selected text to the system clipboard
