return {
  'iamcco/markdown-preview.nvim',
  build = ":call mkdp#util#install()",
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  ft = { 'markdown' },
  keys = {
    { '<leader>m', mode = { 'n', 'v' }, '<cmd>MarkdownPreviewToggle<cr>', desc = '[m]arkdown preview' },
  },
}
