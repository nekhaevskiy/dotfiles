return {
  "CopilotC-Nvim/CopilotChat.nvim",
  opts = function()
    local user = vim.env.USER or "User"
    return {
      model = "claude-sonnet-4.5",
      auto_insert_mode = true,
      headers = {
        user = "  " .. user .. " ",
        assistant = "  Copilot ",
        tool = "󰊳  Tool ",
      },
      window = {
        width = 0.4,
      },
      mappings = {
        close = {
          insert = "<C-q>",
        },
        submit_prompt = {
          insert = "<C-CR>",
        },
      },
    }
  end,
}
