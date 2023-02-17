-- :help options

-- use system clipboard
vim.opt.clipboard = "unnamedplus"

-- no swap file
vim.opt.swapfile = false

-- save undo-trees in files
vim.opt.undofile = true
vim.opt.undodir = os.getenv("XDG_CONFIG_HOME") .. "/nvim/undo"

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
-- vim.opt.scrolloff = 10

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

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- open file/link under cursor in a default app
keymap("n", "gx", "<cmd>call jobstart(['xdg-open', expand('<cfile>')], {'detach': v:true})<CR>", opts)

-- windows
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- split window horizontally
keymap("n", "<C-w>h", "<C-w>s", opts)

-- vim-unimpaired inspired mapping
local opts_next_prev = { noremap = true }
keymap("n", "[a", "<cmd>previous<CR>", opts_next_prev)
keymap("n", "]a", "<cmd>next<CR>", opts_next_prev)
keymap("n", "[A", "<cmd>first<CR>", opts_next_prev)
keymap("n", "]A", "<cmd>last<CR>", opts_next_prev)
keymap("n", "[b", "<cmd>bprevious<CR>", opts_next_prev)
keymap("n", "]b", "<cmd>bnext<CR>", opts_next_prev)
keymap("n", "[B", "<cmd>bfirst<CR>", opts_next_prev)
keymap("n", "]B", "<cmd>blast<CR>", opts_next_prev)
keymap("n", "[l", "<cmd>lprevious<CR>", opts_next_prev)
keymap("n", "]l", "<cmd>lnext<CR>", opts_next_prev)
keymap("n", "[L", "<cmd>lfirst<CR>", opts_next_prev)
keymap("n", "]L", "<cmd>llast<CR>", opts_next_prev)
keymap("n", "[q", "<cmd>cprevious<CR>", opts_next_prev)
keymap("n", "]q", "<cmd>cnext<CR>", opts_next_prev)
keymap("n", "[Q", "<cmd>cfirst<CR>", opts_next_prev)
keymap("n", "]Q", "<cmd>clast<CR>", opts_next_prev)
keymap("n", "[t", "<cmd>tabprevious<CR>", opts_next_prev)
keymap("n", "]t", "<cmd>tabnext<CR>", opts_next_prev)
keymap("n", "[T", "<cmd>tabfirst<CR>", opts_next_prev)
keymap("n", "]T", "<cmd>tablast<CR>", opts_next_prev)
