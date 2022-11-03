local status, lualine = pcall(require, "lualine")
if not status then
  return
end

lualine.setup({
  options = {
    theme = "onedark",
  },
  sections = {
    lualine_b = { "branch" },
    lualine_x = {
      {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        symbols = { error = " ", warn = " ", info = " ", hint = " " },
      },
      "encoding",
      "filetype",
    },
  },
  inactive_sections = {
    lualine_c = {
      {
        "filename",
        file_status = true,
        path = 1, -- 1 = relative path
      },
    },
  },
  extensions = { "fugitive" },
})
