return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>e", "<cmd>Yazi<cr>", desc = "Open yazi file manager" },
  },
  opts = {
    -- Open yazi instead of netrw for directories
    open_for_directories = false,
    -- Keymaps inside yazi (optional customization)
    keymaps = {
      show_help = "<f1>",
    },
  },
}
