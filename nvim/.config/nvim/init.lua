-- :help options
vim.opt.fileencoding = "utf-8"

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.title = true
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.path:append({ "**" }) -- Finding files - Search down into subfolders
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.splitbelow = true
vim.opt.splitright = true

-- highlight configuration
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.pumblend = 5

-- clipboard
vim.opt.clipboard = "unnamedplus"

require("keymap")
require("plugins")
