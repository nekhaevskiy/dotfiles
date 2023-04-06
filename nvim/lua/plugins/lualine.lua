return {
  "nvim-lualine/lualine.nvim",
  opts = {
    winbar = {
      lualine_c = {
        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
        { "filename", path = 0, symbols = { modified = "  ", readonly = "", unnamed = "" } },
      },
    },
    inactive_winbar = {
      lualine_c = {
        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
        { "filename", path = 0, symbols = { modified = "  ", readonly = "", unnamed = "" } },
      },
    },
  },
}
