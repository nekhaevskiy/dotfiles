local gitsigns = require("gitsigns")

gitsigns.setup({
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map("n", "]g", function()
			if vim.wo.diff then
				return "]g"
			end
			vim.schedule(function()
				gs.next_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		map("n", "[g", function()
			if vim.wo.diff then
				return "[g"
			end
			vim.schedule(function()
				gs.prev_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		-- Actions
		map("n", "<leader>gb", function()
			gs.blame_line({ full = true })
		end)
		-- map("n", "<leader>gb", gs.toggle_current_line_blame)
		map("n", "<leader>gd", gs.toggle_deleted)
		map("n", "<leader>gp", gs.preview_hunk)
		map({ "n", "v" }, "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>")
		map({ "n", "v" }, "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>")
		map("n", "<leader>gu", gs.undo_stage_hunk)
		-- map('n', '<leader>hS', gs.stage_buffer)
		-- map('n', '<leader>hR', gs.reset_buffer)
		-- map('n', '<leader>hd', gs.diffthis)
		-- map('n', '<leader>hD', function() gs.diffthis('~') end)

		-- Text object
		-- map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
	end,
})
