return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    event_handlers = {
      {
        event = "file_opened",
        handler = function()
          --auto close
          require("neo-tree.command").execute({ action = "close" })
        end,
      },
    },
  },
}
