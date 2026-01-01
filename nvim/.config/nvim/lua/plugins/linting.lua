return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    -- Configure linters by filetype
    lint.linters_by_ft = {
      javascript = { "eslint" },
      typescript = { "eslint" },
      javascriptreact = { "eslint" },
      typescriptreact = { "eslint" },
    }

    -- Helper function to check if linter is available
    local function lint_if_available()
      local ft = vim.bo.filetype
      local linters = lint.linters_by_ft[ft]
      
      if not linters then
        return
      end

      -- Check if the linter executable exists
      for _, linter_name in ipairs(linters) do
        local linter = lint.linters[linter_name]
        if linter and linter.cmd then
          local cmd = type(linter.cmd) == "table" and linter.cmd[1] or linter.cmd
          if type(cmd) == "string" and vim.fn.executable(cmd) == 1 then
            lint.try_lint(linter_name)
          end
        end
      end
    end

    -- Create autocommand to trigger linting
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = lint_if_available,
    })

    -- Manual lint command
    vim.keymap.set("n", "<leader>ll", lint_if_available, { desc = "Trigger linting for current file" })
  end,
}

