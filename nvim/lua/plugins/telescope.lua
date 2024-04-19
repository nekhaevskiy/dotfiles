return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      layout_strategy = "vertical",
    },
  },
  keys = {
    { "<leader>gs", "<cmd>Telescope git_status initial_mode=normal<CR>", desc = "Status" },
  },
}
