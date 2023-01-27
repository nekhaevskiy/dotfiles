-- :help options

-- use system clipboard
vim.opt.clipboard = "unnamedplus"

-- no swap file
vim.opt.swapfile = false

-- save undo-trees in files
vim.opt.undofile = true
-- vim.opt.undodir = "$HOME/.config/nvim/undo//"

-- number of undo saved
vim.opt.undolevels = 10000
vim.opt.undoreload = 10000

-- show line numbers
vim.opt.number = true

-- set relative line numbers
vim.opt.relativenumber = true

-- use 4 spaces instead of tab
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- copy indent from current line when starting a new line
vim.opt.autoindent = true

-- show substitution
vim.opt.inccommand = "nosplit"

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.smartindent = true

-- vim.opt.wrap = false

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.title = true
vim.opt.scrolloff = 10

-- vim.opt.fileencoding = "utf-8"
-- vim.opt.inccommand = "split"
-- vim.opt.breakindent = true
-- vim.opt.path:append({ "**" }) -- Finding files - Search down into subfolders
-- vim.opt.wildignore:append({ "*/node_modules/*" })

-- highlight configuration
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.pumblend = 5

-- folding
-- vim.opt.foldmethod = "indent"
