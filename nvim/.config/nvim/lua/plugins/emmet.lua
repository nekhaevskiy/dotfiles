return {
  "olrtg/emmet-language-server",
  ft = { "html", "css", "scss", "less", "javascriptreact", "typescriptreact", "vue", "svelte" },
  config = function()
    vim.lsp.config("emmet_language_server", {
      filetypes = { "html", "css", "scss", "less", "javascriptreact", "typescriptreact", "vue", "svelte" },
    })
    vim.keymap.set("n", "<leader>te", function()
      local clients = vim.lsp.get_clients({ name = "emmet_language_server" })
      if #clients > 0 then
        for _, client in ipairs(clients) do
          client:stop()
        end
        vim.lsp.enable("emmet_language_server", false)
        vim.notify("Emmet disabled", vim.log.levels.INFO)
      else
        vim.lsp.enable("emmet_language_server")
        vim.notify("Emmet enabled", vim.log.levels.INFO)
      end
    end, { desc = "Toggle Emmet" })
  end,
}
