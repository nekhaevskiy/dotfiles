return {
  -- add onedark
  { "navarasu/onedark.nvim", opts = {
    style = "darker",
  } },

  -- configure LazyVim to load onedark
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
