return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build =
      'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    }
  },
  config = function()
    require('telescope').setup({
      defaults = {
        layout_strategy = "vertical"
      },
    })
    require('telescope').load_extension('fzf')
  end,
  branch = '0.1.x',
  keys = {
    { '<leader>fb', function() require('telescope.builtin').buffers() end,    desc = 'Find Buffers' },
    { '<leader>ff', function() require('telescope.builtin').find_files() end, desc = 'Find Files' },
    { '<leader>fh', function() require('telescope.builtin').help_tags() end,  desc = 'Find Help' },
    {
      '<leader>fj',
      function() require('telescope.builtin').jumplist({ show_line = false }) end,
      desc = 'Find Jumplist'
    },
    { '<leader>fk', function() require('telescope.builtin').keymaps() end,     desc = 'Find Keymaps' },
    { '<leader>fl', function() require('telescope.builtin').live_grep() end,   desc = 'Find Live grep' },
    { '<leader>fm', function() require('telescope.builtin').marks() end,       desc = 'Find Marks' },
    { '<leader>fo', function() require('telescope.builtin').oldfiles() end,    desc = 'Find Old files' },
    { '<leader>fq', function() require('telescope.builtin').quickfix() end,    desc = 'Find Quickfix list' },
    { '<leader>fr', function() require('telescope.builtin').registers() end,   desc = 'Find Registers' },
    { '<leader>fs', function() require('telescope.builtin').grep_string() end, desc = 'Find grep String' },
    { '<leader>gf', function() require('telescope.builtin').git_files() end,   desc = 'Git Files' },
    { '<leader>gs', function() require('telescope.builtin').git_status() end,  desc = 'Git Status' },
  },
}
