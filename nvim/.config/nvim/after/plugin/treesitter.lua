local configs = require("nvim-treesitter.configs")

configs.setup({
	ensure_installed = { "css", "html", "json", "lua", "tsx", "typescript" },
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
})
