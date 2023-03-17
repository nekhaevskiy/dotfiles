return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    event_handlers = {
      {
        event = "file_opened",
        handler = function()
          --auto close
          require("neo-tree").close_all()
        end,
      },
    },
    window = {
      mappings = {
        ["S"] = "none",
        ["_"] = "open_split",
        ["s"] = "none",
        ["|"] = "open_vsplit",
      },
    },
  },
}
