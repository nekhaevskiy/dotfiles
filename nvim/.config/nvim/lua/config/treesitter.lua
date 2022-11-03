local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup({
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "css",
    "html",
    "json",
    "lua",
    "tsx",
    "typescript",
  },
  autotag = {
    enable = true,
  },
})
