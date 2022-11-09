-- :help options

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.smartindent = true

-- vim.opt.wrap = false

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.title = true
vim.opt.scrolloff = 1

-- vim.opt.fileencoding = "utf-8"
-- vim.opt.inccommand = "split"
-- vim.opt.breakindent = true
-- vim.opt.path:append({ "**" }) -- Finding files - Search down into subfolders
-- vim.opt.wildignore:append({ "*/node_modules/*" })

-- highlight configuration
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.pumblend = 5

-- clipboard
vim.opt.clipboard = "unnamedplus"

require("keymap")
require("plugins")
