local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- open file/link under cursor in a default app
keymap("n", "gx", "<cmd>call jobstart(['xdg-open', expand('<cfile>')], {'detach': v:true})<cr>", opts)

-- vim-unimpaired inspired mapping
local opts_next_prev = { noremap = true }
keymap("n", "[a", "<cmd>previous<cr>", opts_next_prev)
keymap("n", "]a", "<cmd>next<cr>", opts_next_prev)
keymap("n", "[A", "<cmd>first<cr>", opts_next_prev)
keymap("n", "]A", "<cmd>last<cr>", opts_next_prev)
keymap("n", "[b", "<cmd>bprevious<cr>", opts_next_prev)
keymap("n", "]b", "<cmd>bnext<cr>", opts_next_prev)
keymap("n", "[B", "<cmd>bfirst<cr>", opts_next_prev)
keymap("n", "]B", "<cmd>blast<cr>", opts_next_prev)
keymap("n", "[l", "<cmd>lprevious<cr>", opts_next_prev)
keymap("n", "]l", "<cmd>lnext<cr>", opts_next_prev)
keymap("n", "[L", "<cmd>lfirst<cr>", opts_next_prev)
keymap("n", "]L", "<cmd>llast<cr>", opts_next_prev)
keymap("n", "[q", "<cmd>cprevious<cr>", opts_next_prev)
keymap("n", "]q", "<cmd>cnext<cr>", opts_next_prev)
keymap("n", "[Q", "<cmd>cfirst<cr>", opts_next_prev)
keymap("n", "]Q", "<cmd>clast<cr>", opts_next_prev)
keymap("n", "[t", "<cmd>tabprevious<cr>", opts_next_prev)
keymap("n", "]t", "<cmd>tabnext<cr>", opts_next_prev)
keymap("n", "[T", "<cmd>tabfirst<cr>", opts_next_prev)
keymap("n", "]T", "<cmd>tablast<cr>", opts_next_prev)
