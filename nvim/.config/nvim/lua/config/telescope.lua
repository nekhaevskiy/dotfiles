local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

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
keymap("n", "<leader>f<leader>", function()
	builtin.resume()
end)
keymap("n", "<leader>fb", function()
	builtin.buffers()
end)
keymap("n", "<leader>fd", function()
	builtin.diagnostics()
end)
keymap("n", "<leader>ff", function()
	builtin.find_files({
		no_ignore = false,
		hidden = true,
	})
end)
keymap("n", "<leader>fg", function()
	builtin.git_status()
end)
keymap("n", "<leader>fh", function()
	builtin.help_tags()
end)
keymap("n", "<leader>fl", function()
	builtin.live_grep()
end)
