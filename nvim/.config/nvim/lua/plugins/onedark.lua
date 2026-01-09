return {
  "navarasu/onedark.nvim",
  priority = 1000,
  config = function()
    require("onedark").setup({
      style = "darker", -- Options: dark, darker, cool, deep, warm, warmer
      colors = {
        bg0 = "#0d0d0d",  -- Main background (darker than default)
      },
    })
    require("onedark").load()
  end,
}
