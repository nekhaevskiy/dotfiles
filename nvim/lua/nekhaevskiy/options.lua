vim.g.mapleader = " "

local opt = vim.opt

opt.cursorline = true
opt.expandtab = true
opt.hlsearch = false
opt.ignorecase = true
opt.list = true
opt.number = true
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
opt.swapfile = false
opt.tabstop = 2
opt.termguicolors = true
opt.undofile = true
opt.updatetime = 200
opt.wrap = false

-- Folding
opt.foldlevel = 99
opt.foldtext = "v:lua.require'nekhaevskiy.lazyvim-util'.foldtext()"
opt.statuscolumn = [[%!v:lua.require'nekhaevskiy.lazyvim-util'.statuscolumn()]]
opt.foldmethod = "indent"
-- opt.foldmethod = "expr"
-- opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
