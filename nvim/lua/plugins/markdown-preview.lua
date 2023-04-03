return {
  "iamcco/markdown-preview.nvim",
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  keys = {
    {
      "<leader>fm",
      "<cmd>MarkdownPreview<cr>",
      desc = "Open markdown preview",
    },
  },
}
