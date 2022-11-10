local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- open file/link under cursor in a default app
keymap("n", "gx", "<cmd>call jobstart(['xdg-open', expand('<cfile>')], {'detach': v:true})<CR>", opts)

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
