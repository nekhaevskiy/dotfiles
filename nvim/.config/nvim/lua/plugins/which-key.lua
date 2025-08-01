return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  opts = {
    icons = {
      -- set icon mappings to true
      mappings = true,
      -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
      -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
      keys = {},
    },

    -- Document existing key chains
    spec = {
      { '<leader>a', group = '[A]I', mode = { 'n', 'x' } },
      { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
      { '<leader>d', group = '[D]ocument' },
      { '<leader>f', group = '[F]ind' },
      { '<leader>g', group = '[G]it', mode = { 'n', 'v' } },
      { '<leader>h', group = '[H]arpoon' },
      { '<leader>r', group = '[R]ename' },
      { '<leader>t', group = '[T]oggle' },
      { '<leader>w', group = '[W]orkspace' },
    },
  },
}
