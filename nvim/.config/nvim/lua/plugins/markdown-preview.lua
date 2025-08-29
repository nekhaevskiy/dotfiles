return {
  'iamcco/markdown-preview.nvim',
  build = function()
    vim.fn['mkdp#util#install']()
  end,
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  ft = { 'markdown' },
  keys = {
    { '<leader>m', mode = { 'n', 'v' }, '<cmd>MarkdownPreviewToggle<cr>', desc = '[m]arkdown preview' },
  },
}
