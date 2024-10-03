return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          visible = true
        }
      },
      close_if_last_window = true
    })

    vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle reveal_force_cwd<cr>")
  end,
}
