return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  opts = {
    panel = { enabled = false },
    suggestion = { enabled = false },
    filetypes = {
      markdown = true,
      help = true,
    },
  },
}
