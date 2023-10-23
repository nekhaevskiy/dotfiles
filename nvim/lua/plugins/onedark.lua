return {
  -- the colorscheme should be available when starting Neovim
  "navarasu/onedark.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  config = function()
    require("onedark").setup {
      style = "darker"
    }
    require("onedark").load()
  end,
  priority = 1000, -- make sure to load this before all the other start plugins
}
