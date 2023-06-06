return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "natecraddock/telescope-zf-native.nvim",
    config = function()
      require("telescope").load_extension("zf-native")
    end,
  },
  keys = {
    { "<leader>bb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
  },
  opts = {
    defaults = {
      layout_strategy = "vertical",
    },
  },
}
