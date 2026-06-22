# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

Dotfiles managed with GNU Stow. Each top-level directory is a stow package that mirrors the home directory structure (e.g. `nvim/.config/nvim/` maps to `~/.config/nvim/`).

## Common Commands

```bash
# Apply a package (creates symlinks)
stow <package>

# Reapply after changes
stow -R <package>

# Remove a package
stow -D <package>

# After modifying shell config
source ~/.config/zsh/.zshrc   # or open a new terminal
```

Two packages are **not stow-managed** and require their own setup scripts:
```bash
bash ~/dotfiles/gnome-terminal/setup.sh   # Ubuntu
bash ~/dotfiles/macos-terminal/setup.sh   # macOS
```

After stowing yazi, install plugins:
```bash
yazi.ya pkg install   # snap install uses yazi.ya, not ya
```

## Commit Message Format

`<component>: <description>` — lowercase component (matches the stow package name), lowercase verb to start description, no trailing period.

```
nvim: add formatting on save for Python
zsh-linux: add bun to PATH
```

## Neovim Architecture

`nvim/.config/nvim/` uses Lazy.nvim with a flat plugin-per-file layout:

- `lua/config/` — `options.lua`, `keymaps.lua`, `lazy.lua` (bootstrap + plugin loader)
- `lua/plugins/` — one file per feature; all files are auto-imported via `{ import = "plugins" }`

**Key plugins and their roles:**
- `lsp.lua` — Mason + mason-lspconfig; auto-installs `pyright`, `ts_ls`, `lua_ls`, `jsonls`
- `fzf-lua.lua` — primary fuzzy finder; used by LSP keymaps for references, symbols, diagnostics
- `yazi.lua` — file manager on `<leader>e` (replaced nvim-tree)
- `completion.lua`, `formatting.lua`, `linting.lua` — editing pipeline
- `copilot.lua` — GitHub Copilot

**Adding a new plugin:** create a new file in `lua/plugins/` returning a Lazy spec. It is picked up automatically.

**LSP keymaps** (set on `LspAttach` in `lsp.lua`): `gd` definition, `grr` references (fzf-lua), `gi` implementation, `<leader>ss` document symbols, `<leader>sS` workspace symbols, `<leader>ca` code action, `<leader>rn` rename.

## Theme

OneDark is used across all tools — nvim (`onedark.lua`), gnome-terminal, macos-terminal, lazygit, yazi. Keep new tool configs consistent with this theme.

## Platform Notes

- `zsh-linux/` and `zsh-macos/` are mutually exclusive; stow only the one matching the OS
- Ubuntu dependencies (zsh, stow, ripgrep, fzf, starship, zoxide, lazygit, nvim, zellij, yazi) are documented in `README.md`
