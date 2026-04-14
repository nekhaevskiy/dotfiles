return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local fzf = require("fzf-lua")
		fzf.setup({
			winopts = {
				preview = {
					layout = "vertical",
					vertical = "down:50%",
				},
			},
			fzf_opts = {
				["--cycle"] = true,
			},
			keymap = {
				fzf = {
					["ctrl-x"] = "abort",
					["enter"] = "accept",
					["page-down"] = "preview-down",
					["page-up"] = "preview-up",
				},
				builtin = {
					["<PageDown>"] = "preview-down",
					["<PageUp>"] = "preview-up",
				},
			},
		})

		vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "Find buffers" })
		vim.keymap.set("n", "<leader>ff", function()
			fzf.files({ cmd = "rg --files --no-ignore --glob '!node_modules'" })
		end, { desc = "Find files" })
		vim.keymap.set("n", "<leader>fg", fzf.git_status, { desc = "Git changed files" })
		vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "Help tags" })
		vim.keymap.set("n", "<leader>fl", fzf.live_grep, { desc = "Live grep" })
		vim.keymap.set("n", "<leader>fo", fzf.oldfiles, { desc = "Oldfiles" })
	end,
}
