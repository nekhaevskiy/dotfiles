return {
  'nvim-treesitter/nvim-treesitter-context',
  opts = {},
  cmd = { 'TSContext' },
  keys = {
    {
      '<leader>tc',
      '<cmd>TSContext toggle<cr>',
      desc = 'treesitter [c]ontext',
    },
  },
}
