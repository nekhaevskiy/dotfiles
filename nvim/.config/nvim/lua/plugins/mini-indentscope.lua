return {
  'echasnovski/mini.indentscope',
  version = '*',
  opts = {
    options = {
      -- Whether to first check input line to be a border of adjacent scope.
      -- Use it if you want to place cursor on function header to get scope of
      -- its body.
      try_as_border = true,
    },
  },
}
