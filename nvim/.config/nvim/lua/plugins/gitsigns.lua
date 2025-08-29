return {
  'lewis6991/gitsigns.nvim',
  opts = {
    on_attach = function(bufnr)
      local gitsigns = require 'gitsigns'

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map('n', ']c', function()
        if vim.wo.diff then
          vim.cmd.normal { ']c', bang = true }
        else
          gitsigns.nav_hunk 'next'
        end
      end, { desc = 'Jump to next [c]hange' })

      map('n', '[c', function()
        if vim.wo.diff then
          vim.cmd.normal { '[c', bang = true }
        else
          gitsigns.nav_hunk 'prev'
        end
      end, { desc = 'Jump to previous [c]hange' })

      -- Actions
      map('n', '<leader>gs', gitsigns.stage_hunk, { desc = '[s]tage hunk' })
      map('n', '<leader>gr', gitsigns.reset_hunk, { desc = '[r]eset hunk' })

      map('v', '<leader>gs', function()
        gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = '[s]tage hunk' })

      map('v', '<leader>gr', function()
        gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = '[r]eset hunk' })

      map('n', '<leader>gS', gitsigns.stage_buffer, { desc = '[S]tage buffer' })
      map('n', '<leader>gR', gitsigns.reset_buffer, { desc = '[R]eset buffer' })
      map('n', '<leader>gp', gitsigns.preview_hunk, { desc = '[p]review hunk' })
      map('n', '<leader>gi', gitsigns.preview_hunk_inline, { desc = 'preview [i]nline hunk' })

      map('n', '<leader>gb', function()
        gitsigns.blame_line { full = true }
      end, { desc = '[b]lame line' })

      map('n', '<leader>gd', gitsigns.diffthis, { desc = '[d]iff this' })

      map('n', '<leader>gD', function()
        gitsigns.diffthis '~'
      end, { desc = '[D]iff this' })

      map('n', '<leader>gq', gitsigns.setqflist, { desc = 'set [q]uickfixlist' })
      map('n', '<leader>gQ', function()
        gitsigns.setqflist 'all'
      end, { desc = 'set [Q]uickfixlist' })

      -- Toggles
      map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = 'current [b]lame line' })
      map('n', '<leader>tw', gitsigns.toggle_word_diff, { desc = '[w]ord diff' })

      -- Text object
      map({ 'o', 'x' }, 'ih', gitsigns.select_hunk, { desc = 'select hunk' })
    end,
  },
}
