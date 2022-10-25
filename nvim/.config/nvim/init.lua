-- disable netrw at the very start of your init.lua (strongly advised for nvim-tree)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

require("user.colorscheme")
require("user.keybindings")

-- :help options
local options = {
  backup = false,                                   -- creates a backup file
  clipboard = "unnamedplus",                        -- allows neovim to access the system clipboard
  -- cmdheight = 2,                                    -- more space in the neovim command line for displaying messages
  completeopt = { "menu", "menuone", "noselect" },  -- mostly just for cmp
  conceallevel = 0,                                 -- so that `` is visible in markdown files
  cursorline = true,                                -- highlight the current line
  expandtab = true,                                 -- convert tabs to spaces
  fileencoding = "utf-8",                           -- the encoding written to a file
  guifont = "monospace:h17",                        -- the font used in graphical neovim applications
  ignorecase = true,                                -- ignore case in search patterns
  mouse = "a",                                      -- allow the mouse to be used in neovim
  number = true,                                    -- set numbered lines
  numberwidth = 4,                                  -- set number column width to 4
  pumheight = 10,                                   -- pop up menu height
  relativenumber = true,                            -- set relative numbered lines
  scrolloff = 1,
  shiftwidth = 2,                                   -- the number of spaces inserted for each indentation
  showmode = false,                                 -- we don't need to see things like -- INSERT -- anymore
  -- showtabline = 2,                                  -- always show tabs
  sidescrolloff = 8,
  signcolumn = "yes",                               -- always show the sign column, otherwise it would shift the text each time
  smartcase = true,                                 -- override ignorecase when uppercase character is used in search
  smartindent = true,                               -- make indenting smarter again
  splitbelow = true,                                -- force all horizontal splits to go below current window
  splitright = true,                                -- force all vertical splits to go to the right of current window
  swapfile = false,                                 -- creates a swapfile
  tabstop = 2,                                      -- insert 2 spaces for a tab
  termguicolors = true,                             -- set term gui colors (most terminals support this)
  timeoutlen = 300,                                 -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                                  -- enable persistent undo
  updatetime = 300,                                 -- faster completion (4000ms default)
  wrap = true,                                      -- display lines as one long line
  writebackup = false,                              -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work

require("plugins")
require("user.lsp")
require("user.settings")
