return {
  "ThePrimeagen/harpoon",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("harpoon").setup({ menu = { width = vim.api.nvim_win_get_width(0) - 50 } })
  end,
  keys = {
    {
      "<leader>ha",
      function()
        require("harpoon.mark").add_file()
      end,
      desc = "Add file to Harpoon",
    },
    {
      "<leader>hh",
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      desc = "Toggle Harpoon menu",
    },
    -- TODO: rewrite using loop
    {
      "<leader>h1",
      function()
        require("harpoon.ui").nav_file(1)
      end,
      desc = "Navigate to file 1",
    },
    {
      "<leader>h2",
      function()
        require("harpoon.ui").nav_file(2)
      end,
      desc = "Navigate to file 2",
    },
    {
      "<leader>h3",
      function()
        require("harpoon.ui").nav_file(3)
      end,
      desc = "Navigate to file 3",
    },
    {
      "<leader>h4",
      function()
        require("harpoon.ui").nav_file(4)
      end,
      desc = "Navigate to file 4",
    },
    {
      "<leader>h5",
      function()
        require("harpoon.ui").nav_file(5)
      end,
      desc = "Navigate to file 5",
    },
    {
      "<leader>h6",
      function()
        require("harpoon.ui").nav_file(6)
      end,
      desc = "Navigate to file 6",
    },
    {
      "<leader>h7",
      function()
        require("harpoon.ui").nav_file(7)
      end,
      desc = "Navigate to file 7",
    },
    {
      "<leader>h8",
      function()
        require("harpoon.ui").nav_file(8)
      end,
      desc = "Navigate to file 8",
    },
    {
      "<leader>h9",
      function()
        require("harpoon.ui").nav_file(9)
      end,
      desc = "Navigate to file 9",
    },
  },
}
