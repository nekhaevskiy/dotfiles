-- only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

-- automatically run :PackerSync whenever plugins.lua is updated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use("navarasu/onedark.nvim")

	use("nvim-tree/nvim-web-devicons")

	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")

	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})

	use("onsails/lspkind-nvim")
	use("L3MON4D3/LuaSnip")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/nvim-cmp")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use("nvim-telescope/telescope-file-browser.nvim")

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	use("nvim-lualine/lualine.nvim")

	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")

	use("numToStr/Comment.nvim")

	use("lewis6991/gitsigns.nvim")

	use("tpope/vim-surround")

	-- use({
	-- 	"akinsho/bufferline.nvim",
	-- 	tag = "v3.*",
	-- 	config = [[require('config.bufferline')]],
	-- })

	-- use({
	-- 	"norcalli/nvim-colorizer.lua",
	-- 	config = function()
	-- 		require("colorizer").setup()
	-- 	end,
	-- })

	-- use({
	-- 	"dinhhuy258/git.nvim",
	-- 	config = [[require('config.git')]],
	-- })

	-- use({
	-- 	"glepnir/lspsaga.nvim",
	-- 	branch = "main",
	-- 	config = [[require('config.lspsaga')]],
	-- })
end)
