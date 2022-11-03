local status_ok, packer = pcall(require, "packer")
if not status_ok then
  print("Packer is not installed")
  return
end

return packer.startup(function(use)
  use("wbthomason/packer.nvim")

  use({
    "navarasu/onedark.nvim",
    config = function()
      require("onedark").load()
    end,
  })

  use({
    "nvim-tree/nvim-web-devicons",
    config = [[require('config.web-devicons')]],
  })

  use({
    "nvim-lualine/lualine.nvim",
    config = [[require('config.lualine')]],
  })

  use({
    "onsails/lspkind-nvim",
    config = [[require('config.lspkind')]],
  })
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = [[require('config.lspsaga')]],
  })
  use("L3MON4D3/LuaSnip")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-nvim-lsp")
  use({
    "hrsh7th/nvim-cmp",
    config = [[require('config.cmp')]],
  })

  use({
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  })
  use({
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup()
    end,
  })
  use({
    "neovim/nvim-lspconfig",
    config = [[require('config.lspconfig')]],
  })

  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })

  use({
    "jose-elias-alvarez/null-ls.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = [[require('config.null-ls')]],
  })

  use({
    "windwp/nvim-autopairs",
    config = [[require('config.autopairs')]],
  })
  use({
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  })

  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.0",
    requires = { "nvim-lua/plenary.nvim" },
    config = [[require('config.telescope')]],
  })
  use("nvim-telescope/telescope-file-browser.nvim")

  use({
    "akinsho/bufferline.nvim",
    tag = "v3.*",
    config = [[require('config.bufferline')]],
  })

  use({
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  })

  use({
    "lewis6991/gitsigns.nvim",
    config = [[require('config.gitsigns')]],
  })
  use({
    "dinhhuy258/git.nvim",
    config = [[require('config.git')]],
  })

  use({
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  })
  use("tpope/vim-surround")
  use("justinmk/vim-sneak")
end)
