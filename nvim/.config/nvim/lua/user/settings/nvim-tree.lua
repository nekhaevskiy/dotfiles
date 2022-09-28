local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

nvim_tree.setup {
  view = {
    width = "50%",
    side = "right"
  },
  git = {
    ignore = false
  },
  actions = {
    open_file = {
      quit_on_open = true
    }
  }
}
