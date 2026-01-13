-- Keymaps configuration
local keymap = vim.keymap

-- Clear search highlights
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

-- Better window navigation
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Resize windows
keymap.set("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
keymap.set("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })
keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })

-- Buffer navigation
keymap.set("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
keymap.set("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })
keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })

-- Better indenting
keymap.set("v", "<", "<gv", { desc = "Indent left" })
keymap.set("v", ">", ">gv", { desc = "Indent right" })

-- Move lines up and down
keymap.set("n", "<A-j>", "<cmd>m .+1<CR>==", { desc = "Move line down" })
keymap.set("n", "<A-k>", "<cmd>m .-2<CR>==", { desc = "Move line up" })
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Better paste
keymap.set("v", "p", '"_dP', { desc = "Paste without yanking" })

-- Stay in visual mode when indenting
keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Quick save
keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })

-- Quick quit
keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })

-- Better line beginning/end
keymap.set("n", "H", "^", { desc = "Go to beginning of line" })
keymap.set("n", "L", "$", { desc = "Go to end of line" })

-- Keep cursor centered when scrolling
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })

-- Keep search centered
keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })

-- Diagnostic keymaps
keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, { desc = "Go to previous diagnostic" })
keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, { desc = "Go to next diagnostic" })
keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostic" })
keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Diagnostic list" })

-- Copy diagnostic message to clipboard
keymap.set("n", "<leader>dy", function()
	local diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line(".") - 1 })
	if #diagnostics == 0 then
		vim.notify("No diagnostic at cursor", vim.log.levels.WARN)
		return
	end

	local messages = {}
	for _, diag in ipairs(diagnostics) do
		table.insert(messages, diag.message)
	end

	local text = table.concat(messages, "\n")
	vim.fn.setreg("+", text)
	vim.notify("Diagnostic copied to clipboard", vim.log.levels.INFO)
end, { desc = "Copy diagnostic to clipboard" })
