return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  dependencies = {
    -- LSP servers management
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },

    -- Autocompletion
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/nvim-cmp' },
    { 'L3MON4D3/LuaSnip' },

    -- for some keybindings
    { 'nvim-telescope/telescope.nvim' },
  },
  config = function()
    local lsp_zero = require('lsp-zero')

    lsp_zero.on_attach(function(_, bufnr)
      local opts = { buffer = bufnr, remap = false }

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gd', function() require('telescope.builtin').lsp_definitions({ show_line = false }) end, opts)
      vim.keymap.set('n', 'go', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', 'gD', vim.lsp.buf.type_definition, opts)
      vim.keymap.set('n', 'gr', function() require('telescope.builtin').lsp_references({ show_line = false }) end, opts)
      vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, opts)
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
      vim.keymap.set('n', 'gl', vim.diagnostic.open_float)
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "<leader>ds", function() require('telescope.builtin').lsp_document_symbols() end, opts)
    end)

    lsp_zero.format_on_save({
      format_opts = {
        async = false,
        timeout_ms = 10000,
      },
      servers = {
        ['lua_ls'] = { 'lua' },
        ['tsserver'] = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
      }
    })

    lsp_zero.format_mapping('<F3>', {
      servers = {
        ['lua_ls'] = { 'lua' },
        ['tsserver'] = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
      }
    })

    -- see :help lsp-zero-guide:integrate-with-mason-nvim
    -- to learn how to use mason.nvim with lsp-zero
    require('mason').setup()
    require('mason-lspconfig').setup({
      ensure_installed = { 'lua_ls', 'tsserver' },
      handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
          local lua_opts = lsp_zero.nvim_lua_ls()
          require('lspconfig').lua_ls.setup(lua_opts)
        end,
      }
    })

    local cmp = require('cmp')
    local cmp_action = require('lsp-zero').cmp_action()

    cmp.setup({
      formatting = lsp_zero.cmp_format(),
      mapping = cmp.mapping.preset.insert({
        -- `Enter` key to confirm completion
        ['<CR>'] = cmp.mapping.confirm({ select = false }),

        -- Ctrl+Space to trigger completion menu
        ['<C-Space>'] = cmp.mapping.complete(),

        -- Navigate between snippet placeholder
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),

        -- Scroll up and down in the completion documentation
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),

        -- Enable "Super Tab"
        ['<Tab>'] = cmp_action.luasnip_supertab(),
        ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
      }),
      sources = {
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'luasnip' },
        { name = 'buffer' },
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      }
    })
  end,
}
