require("lualine").setup({
	options = {
		theme = "onedark",
	},
	sections = {
		lualine_b = { "filename" },
		lualine_c = { "branch" },
		lualine_x = {
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = { error = " ", warn = " ", info = " ", hint = " " },
			},
			"encoding",
			"filetype",
		},
	},
	inactive_sections = {
		lualine_b = {
			{
				"filename",
				file_status = true,
				path = 1, -- 1 = relative path
			},
		},
		lualine_c = {},
	},
	tabline = {
		lualine_a = { { "tabs", max_length = vim.o.columns, mode = 2 } },
	},
})
