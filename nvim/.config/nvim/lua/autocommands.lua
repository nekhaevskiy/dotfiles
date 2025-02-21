-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Highlight all matches while searching, but clear them afterwards
vim.api.nvim_create_augroup('yn-incsearch-highlight', { clear = true })
vim.api.nvim_create_autocmd('CmdlineEnter', {
  pattern = { '/', '\\?' },
  group = 'yn-incsearch-highlight',
  command = 'set hlsearch',
})
vim.api.nvim_create_autocmd('CmdlineLeave', {
  pattern = { '/', '\\?' },
  group = 'yn-incsearch-highlight',
  command = 'set nohlsearch',
})
