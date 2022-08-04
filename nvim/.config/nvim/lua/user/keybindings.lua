local opts = { noremap = true, silent = true }

-- shorten function name
local keymap = vim.api.nvim_set_keymap

-- remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-----------
-- Modes --
-----------

-- normal_mode = "n",
-- insert_mode = "i",
-- visual_mode = "v",
-- visual_block_mode = "x",
-- term_mode = "t",
-- command_mode = "c",

-----------------
-- Normal mode --
-----------------

-- better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- resize with arrows
keymap("n", "<C-Up>", "<cmd>resize +2<cr>", opts)
keymap("n", "<C-Down>", "<cmd>resize -2<cr>", opts)
keymap("n", "<C-Left>", "<cmd>vertical resize -2<cr>", opts)
keymap("n", "<C-Right>", "<cmd>vertical resize +2<cr>", opts)

-- navigate buffers
keymap("n", "<A-l>", "<cmd>bnext<cr>", opts)
keymap("n", "<A-h>", "<cmd>bprevious<cr>", opts)
keymap("n", "<leader>q", "<cmd>Bdelete<cr>", opts) -- moll/vim-bbye

-- move text up and down
-- keymap("n", "<A-j>", "<Esc><cmd>m .+1<cr>==gi", opts)
-- keymap("n", "<A-k>", "<Esc><cmd>m .-2<cr>==gi", opts)

-- no highlight
keymap("n", "<leader>/", "<cmd>nohlsearch<cr>", opts)

-----------------
-- Insert mode --
-----------------

-- press jk fast to exit to normal mode
keymap("i", "jk", "<Esc>", opts)

-----------------
-- Visual mode --
-----------------

-- stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- move text up and down
-- keymap("v", "<A-j>", "<cmd>m .+1<cr>==", opts)
-- keymap("v", "<A-k>", "<cmd>m .-2<cr>==", opts)
keymap("v", "p", '"_dP', opts)

-----------------------
-- Visual Block mode --
-----------------------

-- move text up and down
-- keymap("x", "J", "<cmd>move '>+1<cr>gv-gv", opts)
-- keymap("x", "K", "<cmd>move '<-2<cr>gv-gv", opts)
-- keymap("x", "<A-j>", "<cmd>move '>+1<cr>gv-gv", opts)
-- keymap("x", "<A-k>", "<cmd>move '<-2<cr>gv-gv", opts)

-------------------
-- Terminal mode --
-------------------

local term_opts = { silent = true }

-- better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
