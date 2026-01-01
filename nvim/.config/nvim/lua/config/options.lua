-- Editor options and settings
local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs and indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- Line wrapping
opt.wrap = false

-- Search settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.cursorline = true

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Split windows
opt.splitright = true
opt.splitbelow = true

-- Undo and backup
opt.undofile = true
opt.undolevels = 10000
opt.swapfile = false
opt.backup = false

-- Update time (for better performance with plugins like gitsigns)
opt.updatetime = 250
opt.timeoutlen = 300

-- Completion
opt.completeopt = "menu,menuone,noselect"

-- Scrolling
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Command line
opt.cmdheight = 1
opt.showmode = false

-- File encoding
opt.fileencoding = "utf-8"

-- Mouse
opt.mouse = "a"

-- Performance
opt.lazyredraw = false

