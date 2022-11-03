local saga = require("lspsaga")

saga.init_lsp_saga()

local keymap = vim.keymap.set
local opts = { silent = true }

-- Lsp finder find the symbol definition implement reference
-- if there is no implement it will hide
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
keymap("n", "gd", "<cmd>Lspsaga lsp_finder<CR>", opts)

-- Hover Doc
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)

-- Outline
keymap("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts)

-- Peek Definition
-- you can edit the definition file in this flaotwindow
-- also support open/vsplit/etc operation check definition_action_keys
-- support tagstack C-t jump back
keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>", opts)

-- Code action
keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)

-- Rename
keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)

-- Show line diagnostics
keymap("n", "<leader>ld", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)

-- Show cursor diagnostic
keymap("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)

-- Diagnsotic jump can use `<c-o>` to jump back
keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)

-- Only jump to error
keymap("n", "[D", function()
  require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, opts)
keymap("n", "]D", function()
  require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, opts)

-- Float terminal
-- keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm<CR>", opts)
-- if you want pass somc cli command into terminal you can do like this
-- open lazygit in lspsaga float terminal
keymap("n", "<A-g>", "<cmd>Lspsaga open_floaterm lazygit<CR>", opts)
-- close floaterm
keymap("t", "<A-g>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], opts)
