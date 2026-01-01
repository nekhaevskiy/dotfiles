-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Load core configuration
require("config.options")
require("config.keymaps")

-- Load lazy.nvim plugin manager
require("config.lazy")
