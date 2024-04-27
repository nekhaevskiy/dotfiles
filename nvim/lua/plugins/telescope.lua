return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },
  opts = {
    defaults = {
      layout_strategy = "vertical",
    },
  },
  keys = {
    {
      "<leader>fb",
      "<cmd>Telescope buffers sort_mru=true sort_lastused=true initial_mode=normal<cr>",
      desc = "Buffers",
    },
    { "<leader>gs", "<cmd>Telescope git_status initial_mode=normal<CR>", desc = "Status" },
  },
}
