return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    spec = {
      { '<leader>a', group = '[A]I', mode = { 'n', 'x' } },
      { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
      { '<leader>d', group = '[D]ocument' },
      { '<leader>f', group = '[F]ind' },
      { '<leader>g', group = '[G]it', mode = { 'n', 'v' } },
      { '<leader>h', group = '[H]arpoon' },
      { '<leader>t', group = '[T]oggle' },
    },
  },
  -- keys = {
  --   {
  --     '<leader>?',
  --     function()
  --       require('which-key').show { global = false }
  --     end,
  --     desc = 'Buffer Local Keymaps (which-key)',
  --   },
  -- },
}
