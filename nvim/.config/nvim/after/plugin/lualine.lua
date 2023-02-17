local lualine = require("lualine")

lualine.setup({
	options = {
		theme = "onedark",
		globalstatus = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			"branch",
			"diff",
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = { error = " ", warn = " ", info = " ", hint = " " },
			},
		},
		lualine_c = { { "filename", path = 1 } },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
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
	winbar = {
		lualine_c = { "filename" },
	},
	inactive_winbar = {
		lualine_c = { "filename" },
	},
})
