return {
  "L3MON4D3/LuaSnip",
  opts = function()
    require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./my-snippets" } })
    return {
      history = true,
      delete_check_events = "TextChanged",
    }
  end,
}
