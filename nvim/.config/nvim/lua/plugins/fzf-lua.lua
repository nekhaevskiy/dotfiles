return {
  'ibhagwan/fzf-lua',
  -- optional for icon support
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    -- calling `setup` is optional for customization
    require('fzf-lua').setup {
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
    }

    vim.keymap.set('n', '<leader>/', require('fzf-lua').lgrep_curbuf, { desc = 'Find in current buffer ("/")' })
    vim.keymap.set('n', '<leader>fb', require('fzf-lua').buffers, { desc = '[B]uffers' })
    vim.keymap.set('n', '<leader>ff', require('fzf-lua').files, { desc = '[F]iles' })
    vim.keymap.set('n', '<leader>fg', require('fzf-lua').git_status, { desc = 'Git [S]tatus' })
    vim.keymap.set('n', '<leader>fG', require('fzf-lua').grep, { desc = '[G]rep' })
    vim.keymap.set('n', '<leader>fh', require('fzf-lua').helptags, { desc = '[H]elp' })
    vim.keymap.set('n', '<leader>fl', require('fzf-lua').live_grep, { desc = '[L]ive Grep' })
    vim.keymap.set('n', '<leader>fo', require('fzf-lua').oldfiles, { desc = '[O]ld Files' })
    vim.keymap.set('n', '<leader>fr', require('fzf-lua').registers, { desc = '[R]egisters' })
    vim.keymap.set('n', '<leader>fR', require('fzf-lua').resume, { desc = '[R]esume' })
    -- vim.keymap.set('n', '<leader>fG', require('fzf-lua').git_files, { desc = '[G]it files' })
    vim.keymap.set('n', '<leader>dd', function()
      require('fzf-lua').diagnostics_document { sort = true }
    end, { desc = '[D]iagnostics' })
  end,
}
