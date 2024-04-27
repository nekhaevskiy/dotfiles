return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    { "<leader>be", false },
    { "<leader>E", false },
    { "<leader>e", false },
    { "<leader>fe", false },
    { "<leader>fE", false },
    { "<leader>ge", false },
    {
      "<leader>ee",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
      end,
      desc = "Explorer NeoTree (Root Dir)",
      remap = true,
    },
    {
      "<leader>eE",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
      end,
      desc = "Explorer NeoTree (cwd)",
      remap = true,
    },
    {
      "<leader>eg",
      function()
        require("neo-tree.command").execute({ source = "git_status", toggle = true })
      end,
      desc = "Git Explorer",
    },
    {
      "<leader>eb",
      function()
        require("neo-tree.command").execute({ source = "buffers", toggle = true })
      end,
      desc = "Buffer Explorer",
    },
  },
}
