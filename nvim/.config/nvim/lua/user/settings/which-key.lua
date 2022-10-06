local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local mappings = {
  ["/"] = { "<cmd>nohlsearch<cr>", "No highlight" },
  ["e"] = { "<cmd>NvimTreeFindFileToggle<cr>", "Explorer" },
  ["j"] = { "<cmd>lua require 'hop'.hint_words()<cr>", "Jump to word" },
  ["p"] = { "<cmd>PackerSync<cr>", "Packer sync" },

  d = {
    name = "Diagnostics",
    d = { "<cmd>lua require('telescope.builtin').diagnostics()<cr>", "All" },
    j = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Next", },
    k = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev" },
    l = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Line" },
    q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
  },

  f = {
    name = "Find",
    b = { "<cmd>lua require('telescope.builtin').buffers({previewer=false})<cr>", "Buffers", },
    c = { "<cmd>Telescope commands<cr>", "Commands" },
    f = { "<cmd>lua require('telescope.builtin').find_files({previewer=false})<cr>", "Files", },
    g = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Grep" },
    h = { "<cmd>Telescope help_tags<cr>", "Help" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    m = { "<cmd>Telescope man_pages<cr>", "Man pages" },
    o = { "<cmd>lua require('telescope.builtin').oldfiles({previewer=false})<cr>", "Recent files" },
    r = { "<cmd>Telescope registers<cr>", "Registers" },
  },

  g = {
    name = "Git",
    b = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    c = { "<cmd>Telescope git_status<cr>", "Changed files" },
    g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev hunk" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage hunk" },
    u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo stage hunk", },
  },

  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code action" },
    d = { "<cmd>lua require('telescope.builtin').lsp_definitions({jump_type='never',show_line=false})<cr>", "Definitions" },
    f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>LspInstallInfo<cr>", "Installer info" },
    r = { "<cmd>lua require('telescope.builtin').lsp_references({show_line=false})<cr>", "References" },
    R = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace symbols" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document symbols" },
  },
}

local opts = { prefix = "<leader>" }

which_key.setup {}
which_key.register(mappings, opts)
