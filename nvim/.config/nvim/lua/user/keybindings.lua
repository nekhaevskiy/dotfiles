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
keymap("n", "<C-Up>", "<Cmd>resize +2<CR>", opts)
keymap("n", "<C-Down>", "<Cmd>resize -2<CR>", opts)
keymap("n", "<C-Left>", "<Cmd>vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", "<Cmd>vertical resize +2<CR>", opts)

-- navigate buffers
keymap("n", "<A-l>", "<Cmd>bnext<CR>", opts)
keymap("n", "<A-h>", "<Cmd>bprevious<CR>", opts)

-- open file/link under cursor in a default app
keymap("n", "gx", "<Cmd>call jobstart(['xdg-open', expand('<cfile>')], {'detach': v:true})<CR>", opts)

-- move text up and down
-- keymap("n", "<A-j>", "<Esc><Cmd>m .+1<CR>==gi", opts)
-- keymap("n", "<A-k>", "<Esc><Cmd>m .-2<CR>==gi", opts)

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
-- keymap("v", "<A-j>", "<Cmd>m .+1<CR>==", opts)
-- keymap("v", "<A-k>", "<Cmd>m .-2<CR>==", opts)

keymap("v", "p", '"_dP', opts)

-----------------------
-- Visual Block mode --
-----------------------

-- move text up and down
-- keymap("x", "J", "<Cmd>move '>+1<CR>gv-gv", opts)
-- keymap("x", "K", "<Cmd>move '<-2<CR>gv-gv", opts)
-- keymap("x", "<A-j>", "<Cmd>move '>+1<CR>gv-gv", opts)
-- keymap("x", "<A-k>", "<Cmd>move '<-2<CR>gv-gv", opts)

-------------------
-- Terminal mode --
-------------------

-- local term_opts = { silent = true }

-- better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
