return {
  "smoka7/hop.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    { "s", function() require("hop").hint_words() end, mode = { "n", "x", "o" }, desc = "Hop to word" },
  },
}
