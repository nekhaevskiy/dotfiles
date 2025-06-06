return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    {
      '<leader>ha',
      mode = { 'n' },
      function()
        require('harpoon'):list():add()
      end,
      desc = '[A]dd',
    },
    {
      '<leader>hh',
      mode = { 'n' },
      function()
        require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())
      end,
      desc = 'Toggle',
    },
    {
      '<leader>h1',
      mode = { 'n' },
      function()
        require('harpoon'):list():select(1)
      end,
      desc = 'Select [1]',
    },
    {
      '<leader>h2',
      mode = { 'n' },
      function()
        require('harpoon'):list():select(2)
      end,
      desc = 'Select [2]',
    },
    {
      '<leader>h3',
      mode = { 'n' },
      function()
        require('harpoon'):list():select(3)
      end,
      desc = 'Select [3]',
    },
    {
      '<leader>h4',
      mode = { 'n' },
      function()
        require('harpoon'):list():select(4)
      end,
      desc = 'Select [4]',
    },
  },
}
