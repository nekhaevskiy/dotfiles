# Dotfiles

## Installation

You will need `git` and GNU `stow`.

Go to your home directory and clone the repo:

```bash
cd ~ && git clone https://github.com/nekhaevskiy/dotfiles.git
```

Run `stow` to symlink everything or just select what you want

```bash
stow */ # Everything (the '/' ignores the README)
```

```bash
stow zsh # Just my zsh config
```

## Packages

An updated list of all the packages I use can be found in the `packages` directory.

## Key bindings

### alacritty

Ctrl+Shift+Enter = spawn new instance in the same directory
Ctrl+Shift+Space = toggle Vi mode
Ctrl+Shift+C = copy without Vi mode
Ctrl+Shift+V = paste without Vi mode
Ctrl+Shift+U = hint URLs

### i3

#### Apps

Win+Enter = open new terminal
Win+F1 = QuteBrowser
Win+F2 = Firefox
Win+F7 = Slack
Win+F8 = Chromium
Win+F12 = Play/Pause
Win+d = open dmenu launcher

#### Configuration

Win+Shift+c = reload i3's configuration
Win+Shift+r = restart i3 (preserves layout/session)

#### Containers

Win+Shift+q = quit the focused container
Win+[hjkl] = focus container: left (h), down (j), up (k), right (l)
Win+a = focus parent container

#### Display mode

Win+x = open display management

#### Floating

Win+Space = chang focus between tiling/floating container
Win+Shift+Space = toggle tiling/floating

#### Layout

Win+e = switch to split layout (default) and toggle it between horizontal/vertical
Win+s = switch to stacked layout
Win+w = switch to tabbed layout

#### Lock

Win+Ctrl+Shift+l = lock the system

#### Moving

Win+Shift+[hjkl] = move container: left (h), down (j), up (k), right (l)

#### Resize

Win+r = resize menu

#### Scratchpad

Win+Shift+t = scratchpad terminal
Win+Shift+p = scratchpad htop

#### Shutdown

Win+Backspace = lock/logout/suspend/hibernate/reboot/shutdown menu

#### Split

Win+Ctrl+h = split container horizontally (next container will be open under the current one)
Win+Ctrl+v = split container vertically (next container will be open next to the current one)

#### Utility

Win+z = remap Caps Lock to Ctrl and Esc

#### Workspaces

Win+<number> = switch to workspace number <number>
Win+Shift+<number> = move container to workspace number <number>

### nvim

#### Normal mode

##### Window navigation

Ctrl+h = navigate left
Ctrl+j = navigate down
Ctrl+k = navigate up
Ctrl+l = navigate right

##### Explorer

Space+e = open explorer

##### Resize

Ctrl+Up = increase height
Ctrl+Down = decrease height
Ctrl+Right = increase width
Ctrl+Left = decrease width

##### Buffers

Shift+l = next buffer
Shift+h = previous buffer

##### LSP

gd = go to definition
gr = go to references
gD = go to declaration
gi = go to implementation
K = hover
[d = go to previous diagnostic
]d = go to next diagnostic
gl = show line diagnostics

##### Telescope

Space+f+k = keymaps
? = which key

#### Insert mode

jk = Escape

##### Telescope

Ctrl+/ = which key

##### Completion popup

Ctrl+j = select next item
Ctrl+k = select previous item
Ctrl+b = scroll above in the preview window
Ctrl+f = scroll below in the preview window
Ctrl+o = open co popup
Ctrl+e = exit complete popup
Enter = select

#### Visual mode

< = indent selection left
> = indent selection right
> Alt+j = move selection down
> Alt+k = move selection up

### Zsh

- `Ctrl+t` = paste the selected files and directories onto the command-line
- `Ctrl+r` = paste the selected command from history onto the command-line
- `Alt+c` = cd into the selected directory
- `nvim **<Tab>` = fuzzy find files under current directory and open them in nvim
- `kill **<Tab>` = fuzzy completion for PIDs is provided for kill command
