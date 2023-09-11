return {
  'nvim-telescope/telescope.nvim', 
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    defaults = {
      layout_strategy = "vertical"
    }
  },
  tag = '0.1.2',
  keys = {
    {'<leader>fb', function() require('telescope.builtin').buffers() end, desc = 'Find Buffers'},
    {'<leader>ff', function() require('telescope.builtin').find_files() end, desc = 'Find Files'},
    {'<leader>fg', function() require('telescope.builtin').git_files() end, desc = 'Find Git files'},
    {'<leader>fh', function() require('telescope.builtin').help_tags() end, desc = 'Find Help'},
    {'<leader>fs', function() require('telescope.builtin').live_grep() end, desc = 'Find Strings'},
  },
}
