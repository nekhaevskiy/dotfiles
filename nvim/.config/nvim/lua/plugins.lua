local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- install plugins here
return packer.startup(function(use)
  -- common plugins
  use "wbthomason/packer.nvim" -- A use-package inspired plugin manager for Neovim

  -- autopairs
  use "windwp/nvim-autopairs" -- autopairs for neovim written by lua

  -- colorscheme
  use "joshdick/onedark.vim" -- A dark Vim/Neovim color scheme inspired by Atom's One Dark syntax theme
  -- use "lunarvim/colorschemes" -- Collection of colorschemes made to be compatible with LunarVim

  -- comments
  use "numToStr/Comment.nvim" -- Smart and powerful comment plugin for neovim

  -- completion
  use "hrsh7th/nvim-cmp" -- A completion plugin for neovim coded in Lua
  use "hrsh7th/cmp-buffer" -- nvim-cmp source for buffer words
  use "hrsh7th/cmp-cmdline" -- nvim-cmp source for vim's cmdline
  use "hrsh7th/cmp-nvim-lsp" -- nvim-cmp source for neovim builtin LSP client
  use "hrsh7th/cmp-nvim-lua" -- nvim-cmp source for nvim lua
  use "hrsh7th/cmp-path" -- nvim-cmp source for path
  use "saadparwaiz1/cmp_luasnip" -- luasnip completion source for nvim-cmp

  -- fuzzy finder
  use {
    "nvim-telescope/telescope.nvim", -- Find, Filter, Preview, Pick
    tag = '0.1.0',
    requires = {
      "nvim-lua/plenary.nvim", -- required
      "kyazdani42/nvim-web-devicons", -- optional, for file icons
    },
  }
  use {
    "nvim-telescope/telescope-fzf-native.nvim", -- FZF sorter for telescope written in c
    run = "make"
  }
  -- use "nvim-telescope/telescope-media-files.nvim" -- Telescope extension to preview media files using Ueberzug

  -- indentation
  use "lukas-reineke/indent-blankline.nvim" -- Indent guides for Neovim

  -- jump
  use {
    "phaazon/hop.nvim", -- Neovim motions on speed!
    branch = "v2", -- optional but strongly recommended
  }

  -- git
  use "lewis6991/gitsigns.nvim" -- Git integration for buffers

  -- keybindings
  use {
    "folke/which-key.nvim",
    config = [[require('config.which-key')]]
  }

  -- lsp
  use "neovim/nvim-lspconfig" -- Quickstart configs for Nvim LSP
  use "williamboman/nvim-lsp-installer" -- Neovim plugin that allow you to seamlessly manage LSP servers
  use {
    "jose-elias-alvarez/null-ls.nvim", -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more
    requires = { "nvim-lua/plenary.nvim" },
  }

  -- markdown
  use {
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  }

  -- snippets
  use "L3MON4D3/LuaSnip" -- Snippet Engine for Neovim written in Lua
  use "rafamadriz/friendly-snippets" -- Set of preconfigured snippets for different languages

  -- statusline
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = [[require('config.lualine')]]
  }

  -- surrounding
  use "tpope/vim-surround" -- Delete/change/add parentheses/quotes/XML-tags/much more with ease

  -- terminal
  use {
    "akinsho/toggleterm.nvim",
    tag = "*"
  }

  -- tree explorer
  use {
    "kyazdani42/nvim-tree.lua", -- A file explorer tree for neovim written in lua
    requires = {
      "kyazdani42/nvim-web-devicons", -- optional, for file icons
    },
  }

  -- treesitter
  use {
    "nvim-treesitter/nvim-treesitter", -- Nvim Treesitter configurations and abstraction layer
    run = ":TSUpdate",
  }
  use "p00f/nvim-ts-rainbow" -- Rainbow parentheses for neovim using tree-sitter
  use "JoosepAlviste/nvim-ts-context-commentstring" -- Neovim treesitter plugin for setting the commentstring based on the cursor location in a file

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
