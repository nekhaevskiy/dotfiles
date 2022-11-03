local nvim_tree = require('nvim-tree')

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
