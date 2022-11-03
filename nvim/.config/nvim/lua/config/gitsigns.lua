local gitsigns = require("gitsigns")

gitsigns.setup({
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    map("n", "]g", function()
      if vim.wo.diff then
        return "]g"
      end
      vim.schedule(function()
        gs.next_hunk()
      end)
      return "<Ignore>"
    end, { expr = true })

    map("n", "[g", function()
      if vim.wo.diff then
        return "[g"
      end
      vim.schedule(function()
        gs.prev_hunk()
      end)
      return "<Ignore>"
    end, { expr = true })

    map("n", "<leader>gp", gs.preview_hunk)
    map({ "n", "v" }, "<leader>gr", ":Gitsigns reset_hunk<CR>")
    map({ "n", "v" }, "<leader>gs", ":Gitsigns stage_hunk<CR>")
  end,
})
