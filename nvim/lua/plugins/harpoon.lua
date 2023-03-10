return {
  "ThePrimeagen/harpoon",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("harpoon").setup({ menu = { width = vim.api.nvim_win_get_width(0) - 50 } })
  end,
  keys = {
    {
      "<leader>ba",
      function()
        require("harpoon.mark").add_file()
      end,
      desc = "Add file to Harpoon",
    },
    {
      "<leader>bb",
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      desc = "Toggle Harpoon menu",
    },
    {
      "[b",
      function()
        require("harpoon.ui").nav_prev()
      end,
      desc = "Navigate to previous Harpoon file",
    },
    {
      "]b",
      function()
        require("harpoon.ui").nav_next()
      end,
      desc = "Navigate to next Harpoon file",
    },
    -- TODO: rewrite using loop
    {
      "<leader>b1",
      function()
        require("harpoon.ui").nav_file(1)
      end,
      desc = "Navigate to file 1",
    },
    {
      "<leader>b2",
      function()
        require("harpoon.ui").nav_file(2)
      end,
      desc = "Navigate to file 2",
    },
    {
      "<leader>b3",
      function()
        require("harpoon.ui").nav_file(3)
      end,
      desc = "Navigate to file 3",
    },
    {
      "<leader>b4",
      function()
        require("harpoon.ui").nav_file(4)
      end,
      desc = "Navigate to file 4",
    },
    {
      "<leader>b5",
      function()
        require("harpoon.ui").nav_file(5)
      end,
      desc = "Navigate to file 5",
    },
    {
      "<leader>b6",
      function()
        require("harpoon.ui").nav_file(6)
      end,
      desc = "Navigate to file 6",
    },
    {
      "<leader>b7",
      function()
        require("harpoon.ui").nav_file(7)
      end,
      desc = "Navigate to file 7",
    },
    {
      "<leader>b8",
      function()
        require("harpoon.ui").nav_file(8)
      end,
      desc = "Navigate to file 8",
    },
    {
      "<leader>b9",
      function()
        require("harpoon.ui").nav_file(9)
      end,
      desc = "Navigate to file 9",
    },
  },
}
