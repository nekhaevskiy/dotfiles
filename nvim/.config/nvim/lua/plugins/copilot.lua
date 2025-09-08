return {
  'zbirenbaum/copilot.lua',
  opts = {
    panel = {
      keymap = {
        jump_prev = '[[',
        jump_next = ']]',
        accept = '<CR>',
        refresh = 'gr',
        open = '<M-CR>',
      },
    },
    suggestion = {
      keymap = {
        accept = '<M-y>',
        next = '<M-]>',
        prev = '<M-[>',
        dismiss = '<M-e>',
      },
    },
  },
  event = 'InsertEnter',
  cmd = 'Copilot',
  keys = {
    { '<leader>ap', '<cmd>Copilot panel<cr>', desc = '[p]anel' },
    { '<leader>as', '<cmd>Copilot suggestion<cr>', desc = '[s]uggestion' },
  },
}
