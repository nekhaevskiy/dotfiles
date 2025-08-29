return {
  'ibhagwan/fzf-lua',
  -- optional for icon support
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    {
      '<leader>/',
      function()
        require('fzf-lua').lgrep_curbuf()
      end,
      desc = 'Find in current buffer ("/")',
    },
    {
      '<leader>fb',
      function()
        require('fzf-lua').buffers()
      end,
      desc = '[b]uffers',
    },
    {
      '<leader>ff',
      function()
        require('fzf-lua').files()
      end,
      desc = '[f]iles',
    },
    {
      '<leader>fg',
      function()
        require('fzf-lua').git_status()
      end,
      desc = '[g]it status',
    },
    {
      '<leader>fG',
      function()
        require('fzf-lua').grep()
      end,
      desc = '[G]rep',
    },
    {
      '<leader>fh',
      function()
        require('fzf-lua').helptags()
      end,
      desc = '[h]elp',
    },
    {
      '<leader>fl',
      function()
        require('fzf-lua').live_grep()
      end,
      desc = '[l]ive grep',
    },
    {
      '<leader>fo',
      function()
        require('fzf-lua').oldfiles()
      end,
      desc = '[o]ld files',
    },
    {
      '<leader>fr',
      function()
        require('fzf-lua').registers()
      end,
      desc = '[r]egisters',
    },
    {
      '<leader>fR',
      function()
        require('fzf-lua').resume()
      end,
      desc = '[R]esume',
    },
    {
      '<leader>dd',
      function()
        require('fzf-lua').diagnostics_document { sort = true }
      end,
      desc = '[d]iagnostics',
    },
    {
      'grr',
      function()
        require('fzf-lua').lsp_references()
      end,
      desc = 'LSP References',
    },
    -- vim.keymap.set('n', '<leader>fG', require('fzf-lua').git_files, { desc = '[G]it files' })
  },
  opts = {
    winopts = {
      preview = {
        layout = 'vertical',
        vertical = 'down:70%',
      },
    },
    keymap = {
      builtin = {
        true,
        ['<S-down>'] = 'preview-down',
        ['<S-up>'] = 'preview-up',
        ['<M-S-down>'] = 'preview-page-down',
        ['<M-S-up>'] = 'preview-page-up',
      },
      fzf = {
        true,
        ['shift-down'] = 'preview-down',
        ['shift-up'] = 'preview-up',
      },
    },
  },
}
