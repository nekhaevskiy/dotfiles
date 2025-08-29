return {
  'zbirenbaum/copilot.lua',
  opts = {},
  event = 'InsertEnter',
  cmd = 'Copilot',
  keys = {
    { '<leader>ap', '<cmd>Copilot panel<cr>', desc = '[p]anel' },
    { '<leader>as', '<cmd>Copilot suggestion<cr>', desc = '[s]uggestion' },
  },
}
