return {
  "aserowy/tmux.nvim",
  config = function()
    require("tmux").setup({
      navigation = {
        enable_default_keybindings = false,
      },
    })
  end,
  keys = {
    {
      "<C-h>",
      function()
        require("tmux").move_left()
      end,
      desc = "Go to left pane",
    },
    {
      "<C-j>",
      function()
        require("tmux").move_bottom()
      end,
      desc = "Go to bottom pane",
    },
    {
      "<C-k>",
      function()
        require("tmux").move_top()
      end,
      desc = "Go to top pane",
    },
    {
      "<C-l>",
      function()
        require("tmux").move_right()
      end,
      desc = "Go to right pane",
    },
  },
}
