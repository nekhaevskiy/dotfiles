return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function ()
    require('lualine').setup({
      sections = {
        lualine_c = {}
      },
      inactive_sections = {
        lualine_c = {}
      },
      winbar = {
        lualine_c = {'filename'}
      },
      inactive_winbar = {
        lualine_c = {'filename'}
      },
    })
  end
}
