local harpoon = require("harpoon")

harpoon.setup({
	menu = {
		width = vim.api.nvim_win_get_width(0) - 10,
	},
})

local keymap = vim.keymap.set
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

keymap("n", "<leader>ha", mark.add_file)
keymap("n", "<leader>hh", ui.toggle_quick_menu)
keymap("n", "<leader>h1", function()
	ui.nav_file(1)
end)
keymap("n", "<leader>h2", function()
	ui.nav_file(2)
end)
keymap("n", "<leader>h3", function()
	ui.nav_file(3)
end)
keymap("n", "<leader>h4", function()
	ui.nav_file(4)
end)
keymap("n", "<leader>h5", function()
	ui.nav_file(5)
end)
keymap("n", "<leader>h6", function()
	ui.nav_file(6)
end)
keymap("n", "<leader>h7", function()
	ui.nav_file(7)
end)
keymap("n", "<leader>h8", function()
	ui.nav_file(8)
end)
keymap("n", "<leader>h9", function()
	ui.nav_file(9)
end)
keymap("n", "[h", ui.nav_prev)
keymap("n", "]h", ui.nav_next)
