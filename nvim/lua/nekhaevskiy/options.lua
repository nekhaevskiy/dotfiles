vim.g.mapleader = " "

local opt = vim.opt

-- opt.breakindent = true
-- opt.colorcolumn = "80"
opt.cursorline = true
opt.expandtab = true
-- opt.formatoptions:append { "r" } -- Add asterisks in block comments
opt.hlsearch = false
opt.ignorecase = true
-- opt.inccommand = "split"
-- opt.isfname:append("@-@")
opt.list = true
opt.number = true
-- opt.path:append { "**" } -- Finding files - Search down into subfolders
opt.pumblend = 10
opt.relativenumber = true
opt.scrolloff = 4
opt.shiftwidth = 2
opt.sidescrolloff = 8
opt.signcolumn = "yes"
opt.smartcase = true
opt.smartindent = true
opt.splitbelow = true
opt.splitkeep = "screen"
opt.splitright = true
-- opt.softtabstop = 4
opt.swapfile = false
opt.tabstop = 2
opt.termguicolors = true
-- opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.updatetime = 200
-- opt.wildignore:append { "*/node_modules/*" }
opt.wrap = false

-- highlight yanked text for 300ms using the "Visual" highlight group
vim.cmd [[
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=300})
  augroup END
]]
