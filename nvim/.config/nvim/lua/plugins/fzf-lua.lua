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
          vertical = 'down:60%',
        },
      },
      keymap = {
        builtin = {
          true,
          ['<C-d>'] = 'preview-page-down',
          ['<C-u>'] = 'preview-page-up',
        },
      },
    }

    vim.keymap.set('n', '<leader>/', require('fzf-lua').lgrep_curbuf, { desc = 'Find in current buffer ("/")' })
    vim.keymap.set('n', '<leader>fb', require('fzf-lua').buffers, { desc = '[B]uffers' })
    vim.keymap.set('n', '<leader>fc', require('fzf-lua').git_status, { desc = '[C]hanged files' })
    vim.keymap.set('n', '<leader>fd', require('fzf-lua').diagnostics_document, { desc = '[D]iagnostics' })
    vim.keymap.set('n', '<leader>ff', require('fzf-lua').files, { desc = '[F]iles' })
    vim.keymap.set('n', '<leader>fg', require('fzf-lua').git_files, { desc = '[G]it files' })
    vim.keymap.set('n', '<leader>fh', require('fzf-lua').helptags, { desc = '[H]elp' })
    vim.keymap.set('n', '<leader>fk', require('fzf-lua').keymaps, { desc = '[K]eymaps' })
    vim.keymap.set('n', '<leader>fr', require('fzf-lua').resume, { desc = '[R]esume' })
    vim.keymap.set('n', '<leader>ft', require('fzf-lua').live_grep, { desc = '[T]ext' })
    vim.keymap.set('n', '<leader>fw', require('fzf-lua').grep_cword, { desc = 'current [W]ord' })
    vim.keymap.set('n', '<leader>f.', require('fzf-lua').oldfiles, { desc = 'recent Files ("." for repeat)' })
  end,
}
