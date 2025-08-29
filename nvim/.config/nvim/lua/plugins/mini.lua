return {
  'echasnovski/mini.nvim',
  version = '*',
  config = function()
    -- Better Around/Inside textobjects
    -- require('mini.ai').setup { n_lines = 500 }

    -- Visualize indent scope
    -- require('mini.indentscope').setup { options = { try_as_border = true } }

    -- Jump within visible lines
    -- require('mini.jump2d').setup()

    -- Autopairs
    require('mini.pairs').setup {}

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    require('mini.surround').setup {
      mappings = {
        add = 'ys',
        delete = 'ds',
        find = '',
        find_left = '',
        highlight = '',
        replace = 'cs',
        update_n_lines = '',

        -- Add this only if you don't want to use extended mappings
        suffix_last = '',
        suffix_next = '',
      },
      search_method = 'cover_or_next',
    }
    -- Remap adding surrounding to Visual mode selection
    vim.keymap.del('x', 'ys')
    vim.keymap.set('x', 'S', [[:<C-u>lua MiniSurround.add('visual')<CR>]], { silent = true })
    -- Make special mapping for "add surrounding for line"
    vim.keymap.set('n', 'yss', 'ys_', { remap = true })

    -- Simple and easy statusline.
    --  You could remove this setup call if you don't like it,
    --  and try some other statusline plugin
    local statusline = require 'mini.statusline'
    -- set use_icons to true if you have a Nerd Font
    statusline.setup {
      content = {
        active = function()
          local mode, mode_hl = statusline.section_mode { trunc_width = 120 }
          local git = statusline.section_git { trunc_width = 140 }
          local diff = statusline.section_diff { trunc_width = 75 }
          local diagnostics = statusline.section_diagnostics { trunc_width = 75 }
          local lsp = statusline.section_lsp { trunc_width = 75 }
          local filename = statusline.section_filename { trunc_width = 140 }
          local fileinfo = statusline.section_fileinfo { trunc_width = 180 }
          local location = statusline.section_location { trunc_width = 75 }
          local search = statusline.section_searchcount { trunc_width = 75 }

          return statusline.combine_groups {
            { hl = mode_hl, strings = { mode } },
            { hl = 'MiniStatuslineDevinfo', strings = { git, diff, diagnostics, lsp } },
            '%<', -- Mark general truncate point
            { hl = 'MiniStatuslineFilename', strings = { filename } },
            '%=', -- End left alignment
            { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
            { hl = mode_hl, strings = { search, location } },
          }
        end,
        inactive = function()
          local filename = statusline.section_filename { trunc_width = 140 }

          return statusline.combine_groups {
            { hl = 'MiniStatuslineFilename', strings = { filename } },
          }
        end,
      },
      use_icons = true,
    }

    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_filename = function()
      -- In terminal always use plain name
      if vim.bo.buftype == 'terminal' then
        return '%t'
      else
        -- Use fullpath if not truncated
        return '%t%m%r'
      end
    end

    ---@diagnostic disable-next-line: duplicate-set-field
    -- statusline.section_fileinfo = function()
    --   local filetype = vim.bo.filetype
    --   local trunc_width = 120
    --
    --   -- Don't show anything if there is no filetype
    --   if filetype == '' then
    --     return ''
    --   end
    --
    --   -- Construct output string if truncated or buffer is not normal
    --   if statusline.is_truncated(trunc_width) or vim.bo.buftype ~= '' then
    --     return filetype
    --   end
    --
    --   -- Construct output string with extra file info
    --   local encoding = vim.bo.fileencoding or vim.bo.encoding
    --   local format = vim.bo.fileformat
    --
    --   --   return string.format('%s %s[%s] %s', filetype, encoding, format)
    --   return filetype .. ' ' .. encoding .. ' [' .. format .. ']'
    -- end

    -- You can configure sections in the statusline by overriding their
    -- default behavior. For example, here we set the section for
    -- cursor location to LINE:COLUMN
    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return 'L:%l/%L, C:%-2v'
    end
  end,
}
