return {
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          sorting_strategy = "ascending",
          scroll_strategy = "limit",
          layout_strategy = "vertical",
          layout_config = {
            mirror = true,
            prompt_position = "top",
          },
        },
      })

      require("telescope").load_extension("fzf")

      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find)

      vim.keymap.set("n", "<leader>bl", builtin.buffers)

      vim.keymap.set("n", "<leader>dd", function()
        builtin.diagnostics({ bufnr = 0, wrap_results = true })
      end)
      vim.keymap.set("n", "<leader>dl", builtin.diagnostics)

      vim.keymap.set("n", "<leader>ff", builtin.find_files)
      vim.keymap.set("n", "<leader>fh", builtin.help_tags)
      vim.keymap.set("n", "<leader>fr", builtin.oldfiles)
      vim.keymap.set("n", "<leader>fs", builtin.live_grep)
      vim.keymap.set("n", "<leader>fS", builtin.grep_string)

      vim.keymap.set("n", "<leader>gl", builtin.git_status)
    end,
  },
}
