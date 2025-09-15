return {
  'mason-org/mason-lspconfig.nvim',
  dependencies = {
    'mason-org/mason.nvim',
    'neovim/nvim-lspconfig',
    'j-hui/fidget.nvim',
  },
  opts = {
    ensure_installed = { 'lua_ls', 'vtsls' },
  },
}
