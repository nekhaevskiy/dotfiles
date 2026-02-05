return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	build = "make install_jsregexp",
	config = function()
		local ls = require("luasnip")
		local s = ls.snippet
		local t = ls.text_node
		local i = ls.insert_node

		-- Custom arrow function snippet
		ls.add_snippets("javascript", {
			s("afn", {
				t("("),
				i(1),
				t(") => {"),
				i(0),
				t("}"),
			}),
		})

		ls.add_snippets("typescript", {
			s("afn", {
				t("("),
				i(1),
				t(") => {"),
				i(0),
				t("}"),
			}),
		})

		ls.add_snippets("javascriptreact", {
			s("afn", {
				t("("),
				i(1),
				t(") => {"),
				i(0),
				t("}"),
			}),
		})

		ls.add_snippets("typescriptreact", {
			s("afn", {
				t("("),
				i(1),
				t(") => {"),
				i(0),
				t("}"),
			}),
		})
	end,
}
