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
					["alt-j"] = "preview-down",
					["alt-k"] = "preview-up",
				},
				builtin = {
					["<M-j>"] = "preview-down",
					["<M-k>"] = "preview-up",
				},
			},
		})

		vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "Find buffers" })
		vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Find files" })
		vim.keymap.set("n", "<leader>fg", fzf.git_status, { desc = "Git changed files" })
		vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "Help tags" })
		vim.keymap.set("n", "<leader>fl", fzf.live_grep, { desc = "Live grep" })
		vim.keymap.set("n", "<leader>fo", fzf.oldfiles, { desc = "Oldfiles" })
	end,
}
