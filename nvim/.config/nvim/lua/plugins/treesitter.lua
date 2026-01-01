-- Neovim 0.11+ has treesitter built-in
-- This plugin is just for parser management
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
}

