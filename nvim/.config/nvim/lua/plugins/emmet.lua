return {
  "olrtg/emmet-language-server",
  ft = { "html", "css", "scss", "less", "javascriptreact", "typescriptreact", "vue", "svelte" },
  config = function()
    vim.lsp.config("emmet_language_server", {
      filetypes = { "html", "css", "scss", "less", "javascriptreact", "typescriptreact", "vue", "svelte" },
    })
    vim.lsp.enable("emmet_language_server")
  end,
}
