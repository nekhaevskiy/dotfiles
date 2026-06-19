return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "File Manager" },
  },
  opts = {
    view = { width = 35 },
    renderer = { group_empty = true },
    update_focused_file = { enable = true },
    filters = { dotfiles = false, git_ignored = false },
  },
}
