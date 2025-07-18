return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'zbirenbaum/copilot.lua' },
      { 'nvim-lua/plenary.nvim', branch = 'master' }, -- for curl, log and async functions
    },
    build = 'make tiktoken', -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
    },
    keys = {
      -- See Keymaps section for keybindings
      { '<leader>ac', mode = { 'n', 'v' }, '<cmd>CopilotChat<cr>', desc = '[A]I [C]hat' },
      { '<leader>aC', mode = { 'n', 'v' }, '<cmd>CopilotChatClear<cr>', desc = '[A]I chat [C]lear' },
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
