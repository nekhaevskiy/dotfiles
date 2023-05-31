return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { "<leader>bb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
  },
  opts = {
    defaults = {
      layout_strategy = "vertical",
    },
  },
}
