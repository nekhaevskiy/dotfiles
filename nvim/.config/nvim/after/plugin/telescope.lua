local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
	defaults = {
		layout_strategy = "vertical",
		mappings = {
			i = {
				["<C-n>"] = actions.move_selection_next,
				["<C-p>"] = actions.move_selection_previous,
			},
			n = {
				["q"] = actions.close,
			},
		},
	},
	extensions = {
		file_browser = {
			theme = "dropdown",
			hijack_netrw = true,
			mappings = {
				["i"] = {
					["<C-w>"] = function()
						vim.cmd("normal vbd")
					end,
				},
				["n"] = {
					["/"] = function()
						vim.cmd("startinsert")
					end,
					["o"] = actions.select_default,
				},
			},
		},
	},
})

telescope.load_extension("file_browser")

local keymap = vim.keymap.set

local function telescope_buffer_dir()
	return vim.fn.expand("%:p:h")
end

local builtin = require("telescope.builtin")
local themes = require("telescope.themes")

keymap("n", "<leader>e", function()
	telescope.extensions.file_browser.file_browser({
		path = "%:p:h",
		cwd = telescope_buffer_dir(),
		respect_gitignore = false,
		hidden = true,
		grouped = true,
		previewer = false,
		initial_mode = "normal",
		layout_config = { height = 40 },
	})
end)
keymap("n", "<leader>fb", function()
	builtin.buffers(themes.get_dropdown({ initial_mode = "normal" }))
end)
keymap("n", "<leader>fc", builtin.git_status)
keymap("n", "<leader>fd", builtin.diagnostics)
keymap("n", "<leader>ff", function()
	builtin.find_files({
		no_ignore = false,
		hidden = false,
	})
end)
keymap("n", "<leader>fg", builtin.live_grep)
keymap("n", "<leader>fh", builtin.help_tags)
keymap("n", "<leader>fr", builtin.resume)
keymap("n", "gr", function()
	builtin.lsp_references(themes.get_dropdown({ initial_mode = "normal" }))
end)
