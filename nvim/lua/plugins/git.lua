return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        on_attach = function(bufnr)
          local gitsigns = require("gitsigns")

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map("n", "]g", function()
            if vim.wo.diff then
              vim.cmd.normal({ "]c", bang = true })
            else
              gitsigns.nav_hunk("next")
            end
          end)

          map("n", "[g", function()
            if vim.wo.diff then
              vim.cmd.normal({ "[c", bang = true })
            else
              gitsigns.nav_hunk("prev")
            end
          end)

          -- Actions
          map("n", "<leader>gb", function()
            gitsigns.blame_line({ full = true })
          end)
          -- map("n", "<leader>gB", gitsigns.toggle_current_line_blame)
          -- map("n", "<leader>gd", gitsigns.diffthis)
          -- map("n", "<leader>gD", function()
          --   gitsigns.diffthis("~")
          -- end)
          map("n", "<leader>gp", gitsigns.preview_hunk)
          map("n", "<leader>gr", gitsigns.reset_hunk)
          map("v", "<leader>gr", function()
            gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end)
          -- map("n", "<leader>gt", gitsigns.toggle_deleted)
          -- map("n", "<leader>gs", gitsigns.stage_hunk)
          -- map("v", "<leader>gs", function()
          --   gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
          -- end)
          -- map("n", "<leader>gu", gitsigns.undo_stage_hunk)

          -- Text object
          -- map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
        end,
      })
    end,
  },
}
