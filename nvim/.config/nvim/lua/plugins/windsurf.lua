return {
  'Exafunction/windsurf.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require('codeium').setup {
      enable_cmp_source = false,

      virtual_text = {
        enabled = true,

        -- Set to true if you never want completions to be shown automatically.
        manual = true,

        -- A mapping of filetype to true or false, to enable virtual text.
        filetypes = {},

        -- Whether to enable virtual text of not for filetypes not specifically listed above.
        default_filetype_enabled = true,

        -- How long to wait (in ms) before requesting completions after typing stops.
        -- idle_delay = 75,

        -- Priority of the virtual text. This usually ensures that the completions appear on top of
        -- other plugins that also add virtual text, such as LSP inlay hints, but can be modified if
        -- desired.
        virtual_text_priority = 65535,

        -- Set to false to disable all key bindings for managing completions.
        map_keys = true,

        -- The key to press when hitting the accept keybinding but no completion is showing.
        -- Defaults to \t normally or <c-n> when a popup is showing.
        accept_fallback = nil,

        -- Key bindings for managing completions in virtual text mode.
        key_bindings = {
          -- Accept the current completion.
          accept = '<C-y>',
          -- Accept the next word.
          accept_word = false,
          -- Accept the next line.
          accept_line = false,
          -- Clear the virtual text.
          clear = '<C-e>',
          -- Cycle to the next completion.
          next = '<C-n>',
          -- Cycle to the previous completion.
          prev = '<C-p>',
        },
      },
    }

    vim.keymap.set('n', '<leader>cc', require('codeium').chat, { desc = '[C]ode Windsurf [C]hat' })
    vim.keymap.set('i', '<C-n>', require('codeium.virtual_text').cycle_or_complete)
  end,
}
