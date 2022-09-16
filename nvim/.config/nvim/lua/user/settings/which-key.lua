local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local mappings = {
  ["/"] = { "<cmd>nohlsearch<cr>", "No Highlight" },
  ["b"] = { "<cmd>lua require('telescope.builtin').buffers({previewer=false})<cr>", "Buffers", },
  ["e"] = { "<cmd>NvimTreeFindFileToggle<cr>", "Explorer" },
  ["f"] = { "<cmd>lua require('telescope.builtin').find_files({previewer=false})<cr>", "Find files", },
  ["F"] = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Find Text" },
  ["j"] = { "<cmd>lua require 'hop'.hint_words()<cr>", "Jump to Word" },
  ["q"] = { "<cmd>Bdelete<cr>", "Close Buffer" },

  g = {
    name = "Git",
    b = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    c = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk", },
  },

  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = { "<cmd>lua require('telescope.builtin').diagnostics()<cr>", "Diagnostics" },
    f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
    j = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Next Diagnostic", },
    k = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
    l = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Line Diagnostics" },
    q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    R = { "<cmd>lua require('telescope.builtin').lsp_references()<cr>", "References" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
  },

  p = {
    name = "Packer",
    s = { "<cmd>PackerSync<cr>", "Sync" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },

  s = {
    name = "Search",
    c = { "<cmd>Telescope commands<cr>", "Commands" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    o = { "<cmd>lua require('telescope.builtin').oldfiles({previewer=false})<cr>", "Open Recent File" },
    r = { "<cmd>Telescope registers<cr>", "Registers" },
  },
}

local opts = { prefix = "<leader>" }

which_key.setup {}
which_key.register(mappings, opts)
