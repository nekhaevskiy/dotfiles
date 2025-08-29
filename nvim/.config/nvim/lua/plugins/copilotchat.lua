if true then
  return {}
end

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
      model = 'claude-sonnet-4',
      mappings = {
        submit_prompt = {
          normal = '<CR>',
          insert = '<C-CR>',
        },
      },
    },
    keys = {
      -- See Keymaps section for keybindings
      { '<leader>ac', mode = { 'n', 'v' }, '<cmd>CopilotChat<cr>', desc = '[A]I [C]hat' },
      { '<leader>ar', mode = { 'n', 'v' }, '<cmd>CopilotChatReset<cr>', desc = '[A]I chat [R]eset' },
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
