return {
  'stevearc/conform.nvim',
  config = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    require("conform").setup({
      formatters_by_ft = {
        javascript = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescript = { "prettierd" },
        typescriptreact = { "prettierd" },
      },
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
      },
    })
  end
}
