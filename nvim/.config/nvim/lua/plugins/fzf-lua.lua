return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local fzf = require("fzf-lua")
    fzf.setup({})

    vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Find files" })
    vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "Live grep" })
    vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "Find buffers" })
    vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "Help tags" })
    vim.keymap.set("n", "<leader>fr", fzf.oldfiles, { desc = "Recent files" })
  end,
}
