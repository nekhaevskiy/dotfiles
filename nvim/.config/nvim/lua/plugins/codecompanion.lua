return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'j-hui/fidget.nvim',
    'zbirenbaum/copilot.lua',
  },
  opts = {
    ---@module "codecompanion"
    ---@type CodeCompanion.Config
    strategies = {
      chat = {
        adapter = {
          name = 'copilot',
          model = 'claude-sonnet-4',
        },
        keymaps = {
          send = {
            modes = {
              n = '<C-cr>',
              i = '<C-cr>',
            },
          },
          close = {
            modes = {
              n = '<C-q>',
              i = '<C-q>',
            },
          },
        },
      },
    },
  },
  init = function()
    vim.cmd [[cab cc CodeCompanion]]
    require('plugins.codecompanion.fidget-spinner'):init()
  end,
  cmd = { 'CodeCompanion', 'CodeCompanionChat', 'CodeCompanionActions' },
  keys = {
    { '<leader>aa', mode = { 'n', 'v' }, '<cmd>CodeCompanionActions<cr>', desc = '[a]ctions' },
    { '<leader>ac', mode = { 'n', 'v' }, '<cmd>CodeCompanionChat Toggle<cr>', desc = '[c]hat' },
    { 'ga', mode = { 'v' }, '<cmd>CodeCompanionChat Add<cr>', desc = 'Add visually selected text to the chat' },
  },
}
