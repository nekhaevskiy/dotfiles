return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    -- Global variable to track format on save state
    vim.g.autoformat_on_save = true

    conform.setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        lua = { "stylua" },
      },
      format_on_save = function(bufnr)
        -- Disable format on save if toggled off
        if not vim.g.autoformat_on_save then
          return
        end
        return {
          lsp_fallback = true,
          async = false,
          timeout_ms = 1000,
        }
      end,
    })

    -- Toggle autoformat on save
    vim.keymap.set("n", "<leader>tf", function()
      vim.g.autoformat_on_save = not vim.g.autoformat_on_save
      if vim.g.autoformat_on_save then
        vim.notify("Autoformat on save: enabled", vim.log.levels.INFO)
      else
        vim.notify("Autoformat on save: disabled", vim.log.levels.WARN)
      end
    end, { desc = "Toggle autoformat on save" })

    -- Manual format keymap
    vim.keymap.set({ "n", "v" }, "<leader>cf", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}

