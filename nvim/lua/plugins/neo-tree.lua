return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    {
      "<leader>e",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
      end,
      desc = "Explorer NeoTree (cwd)",
      remap = true,
    },
    {
      "<leader>E",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = require("lazyvim.util").get_root() })
      end,
      desc = "Explorer NeoTree (root dir)",
      remap = true,
    },
  },
  opts = {
    event_handlers = {
      {
        event = "file_opened",
        handler = function()
          --auto close
          require("neo-tree.command").execute({ action = "close" })
        end,
      },
    },
  },
}
