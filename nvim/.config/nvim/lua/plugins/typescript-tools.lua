if true then
  return {}
end

return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {
    settings = {
      tsserver_file_preferences = {
        includeInlayParameterNameHints = 'all',
      },
    },
    server = {
      on_attach = function(_, bufnr)
        -- Automatically organize imports on save
        -- vim.cmd [[
        --     augroup LspAutoCmd
        --       autocmd! * <buffer>
        --       autocmd BufWritePre <buffer> lua require('typescript-tools').organize_imports()
        --     augroup END
        --   ]]

        -- Keybinding to organize imports manually
        vim.api.nvim_buf_set_keymap(
          bufnr,
          'n',
          '<leader>co',
          '<cmd>lua require("typescript-tools.api").organize_imports()<CR>',
          { noremap = true, silent = true, desc = '[C]ode [O]rganize imports' }
        )
      end,
    },
  },
  ft = { 'typescript', 'typescriptreact' },
}
