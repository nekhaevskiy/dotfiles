local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

nvim_tree.setup {
  view = {
    width = 50
  }
}

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap("n", "<leader>e", "<cmd>NvimTreeFindFileToggle<cr>", opts)
