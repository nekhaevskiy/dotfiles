return {
  'nvim-treesitter/nvim-treesitter-context',
  keys = {
    {
      '<leader>tc',
      function()
        require('treesitter-context').toggle()
      end,
      desc = 'treesitter [c]ontext',
    },
  },
}
