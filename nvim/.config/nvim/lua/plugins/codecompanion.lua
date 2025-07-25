return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'j-hui/fidget.nvim',
  },
  opts = {
    strategies = {
      chat = {
        adapter = {
          name = 'copilot',
          model = 'claude-sonnet-4',
        },
        keymaps = {
          send = {
            modes = { n = '<cr>', i = '<C-cr>' },
          },
          close = {
            modes = { n = 'q', i = '<C-q>' },
          },
        },
      },
    },
  },
  init = function()
    require('plugins.codecompanion.fidget-spinner'):init()
  end,
  keys = {
    -- See Keymaps section for keybindings
    { '<leader>aa', mode = { 'n', 'v' }, '<cmd>CodeCompanionActions<cr>', desc = '[A]I [A]ctions' },
    { '<leader>ac', mode = { 'n', 'v' }, '<cmd>CodeCompanionChat Toggle<cr>', desc = '[A]I [C]hat' },
    { 'ga', mode = { 'v' }, '<cmd>CodeCompanionChat Add<cr>', desc = 'Add visually selected text to the chat' },
  },
}
