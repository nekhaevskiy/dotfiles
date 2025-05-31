return {
  'smoka7/hop.nvim',
  version = '*',
  opts = {
    keys = 'etovxqpdygfblzhckisuran',
  },
  config = function()
    require('hop').setup { keys = 'etovxqpdygfblzhckisuran' }

    vim.keymap.set('n', '<leader><leader>', require('hop').hint_words, { desc = 'Go to any word in the current buffer' })
  end,
}
