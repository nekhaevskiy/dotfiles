# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a dotfiles repository managing configurations for 28+ tools and applications using GNU Stow for symlink management. Each tool is organized as an independent stow package following the XDG Base Directory specification.

## Common Commands

### Installing/Managing Configurations

```bash
# Install a specific package (creates symlinks)
cd ~/dotfiles
stow <package-name>

# Examples:
stow nvim
stow ghostty
stow hypr

# Remove a package (removes symlinks)
stow -D <package-name>

# Restow (useful after config changes)
stow -R <package-name>
```

### Git Workflow

Standard git commands apply. Follow the commit message style guide:

**Format:** `<component>: <description>`

**Rules:**
- Lowercase component prefix (e.g., `ghostty`, `nvim`, `hypr`)
- Start description with lowercase verb (add, switch, set, remove, etc.)
- No period at end of subject
- Optional: add blank line + bullet points for complex changes

**Examples:**
```
ghostty: add OneDark theme with darker background and larger font

nvim: add complete IDE setup with LSP, completion, and tooling

- Add core config (options, keymaps)
- Setup LSP with pyright, ts_ls, lua_ls
- Add blink.cmp for completion
- Configure GitHub Copilot
```

## Repository Structure

```
dotfiles/
├── README.md
├── .cursor/rules/commit-messages.mdc
└── [stow-packages]/
    └── .config/
        └── [app-name]/
            └── [config files]
```

Each directory at the root (except `.git`, `.cursor`) represents a stow package that mirrors the home directory structure.

## Key Configured Tools

**Primary tools with complex configurations:**
- `nvim/` - Neovim with Lazy.nvim plugin manager, LSP, completion, Copilot
- `hypr/` - Hyprland Wayland compositor with modular configuration
- `bash/` - Shell configuration
- `ghostty/` - Primary terminal emulator
- `lazygit/` - TUI git client

**Theme:** OneDark is used consistently across tools (ghostty, alacritty, lazygit, yazi, nvim)

## Architecture Patterns

### 1. Neovim Configuration (nvim/.config/nvim/)

Modular Lua-based setup with Lazy.nvim:
- `lua/config/` - Core settings (options, keymaps, lazy.lua)
- `lua/plugins/` - Feature-specific plugin files
  - Each plugin in separate file (lsp.lua, copilot.lua, completion.lua, etc.)
  - Plugin specs use lazy loading where appropriate

When modifying nvim config:
- Add new plugins as separate files in `lua/plugins/`
- Core settings go in `lua/config/options.lua` or `lua/config/keymaps.lua`
- LSP configurations in `lua/plugins/lsp.lua`

### 2. Hyprland Configuration (hypr/.config/hypr/)

Layered modular approach:
- `hyprland.conf` - Main entry point
- Sources system defaults from `~/.local/share/omarchy/default/hypr/*`
- Sources theme overrides from `~/.config/omarchy/current/theme/*`
- Sources user configs from `~/.config/hypr/*.conf`

Modular files:
- `looknfeel.conf` - Visual settings (gaps, borders, blur, animations)
- `keybinds.conf` - Keyboard shortcuts
- `input.conf` - Input devices, keyboard layouts (US + Russian)
- `windowrules.conf` - Window-specific rules
- `monitors.conf` - Display configuration

When modifying hypr config:
- Edit specific `.conf` files rather than monolithic config
- NVIDIA-specific settings already configured (see hyprland.conf)

### 3. Git Configuration (git/.config/git/)

Extensive custom aliases for common workflows. Key aliases include:
- Branch management: `co`, `cob`, `db`
- Viewing: `st`, `lg`, `last`
- Staging: `aa`, `unstage`
- Commit helpers with branch-aware templates

## Notes for Working in This Repository

1. **No Build System:** This is a pure configuration repository. No compilation or build steps required.

2. **Testing Changes:** After modifying a config:
   - Restow the package: `stow -R <package>`
   - Restart the affected application
   - For shell configs: `source ~/.bashrc` or open new terminal

3. **Adding New Tools:**
   - Create new directory at root (package name)
   - Mirror home directory structure inside it
   - Add config files to `.config/[tool-name]/`
   - Stow the package
   - Commit with format: `<package>: add initial configuration`

4. **Multi-layout Support:** Keyboard configuration supports US + Russian layouts with Alt+Space switching (see hypr/input.conf)
