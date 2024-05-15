return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      require("mason-lspconfig").setup({
        auto_install = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "nvim-telescope/telescope.nvim",
      "yioneko/nvim-vtsls",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local telescope_builtin = require("telescope.builtin")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local vtsls = require('vtsls')
      local on_attach = function()
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
        vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename)
        vim.keymap.set("n", "gd", function()
          telescope_builtin.lsp_definitions({ show_line = false })
        end, { buffer = 0 })
        vim.keymap.set("n", "gr", function()
          telescope_builtin.lsp_references({ show_line = false })
        end, { buffer = 0 })
        vim.keymap.set("n", "gy", function()
          telescope_builtin.lsp_type_definitions({ show_line = false })
        end, { buffer = 0 })
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
      end

      lspconfig.eslint.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
      lspconfig.vtsls.setup({
        capabilities = capabilities,
        on_attach = function ()
          on_attach()
          vim.keymap.set("n", "<leader>co", vtsls.commands.organize_imports)
          vim.keymap.set("n", "<leader>ct", vtsls.commands.restart_tsserver)
        end,
        settings = {
          typescript = {
            format = { enable = false },
            inlayHints = {
              parameterNames = { enabled = "literals" },
              parameterTypes = { enabled = true },
              variableTypes = { enabled = true },
              propertyDeclarationTypes = { enabled = true },
              functionLikeReturnTypes = { enabled = true },
              enumMemberValues = { enabled = true },
            },
          },
          vtsls = {
            autoUseWorkspaceTsdk = true,
          },
        },
      })
    end,
  },
}
