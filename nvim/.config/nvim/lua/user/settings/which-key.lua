local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local mappings = {
  ["/"] = { "<cmd>nohlsearch<cr>", "No highlight" },
  ["b"] = { "<cmd>lua require('telescope.builtin').buffers({previewer=false})<cr>", "Buffers", },
  ["e"] = { "<cmd>NvimTreeFindFileToggle<cr>", "Explorer" },
  ["j"] = { "<cmd>lua require 'hop'.hint_words()<cr>", "Jump to word" },
  ["p"] = { "<cmd>PackerSync<cr>", "Packer sync" },
  ["q"] = { "<cmd>Bdelete<cr>", "Close buffer" },
  ["w"] = { "<cmd>w<cr>", "Write buffer"},

  f = {
    name = "Find",
    c = { "<cmd>Telescope commands<cr>", "Commands" },
    f = { "<cmd>lua require('telescope.builtin').find_files({previewer=false})<cr>", "Files", },
    g = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Grep" },
    h = { "<cmd>Telescope help_tags<cr>", "Help" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    m = { "<cmd>Telescope man_pages<cr>", "Man pages" },
    r = { "<cmd>Telescope registers<cr>", "Registers" },
    R = { "<cmd>lua require('telescope.builtin').oldfiles({previewer=false})<cr>", "Recent files" },
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
    d = { "<cmd>lua require('telescope.builtin').diagnostics()<cr>", "Diagnostics" },
    f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>LspInstallInfo<cr>", "Installer info" },
    j = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Next diagnostic", },
    k = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Prev diagnostic" },
    l = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Line diagnostics" },
    q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
    R = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    r = { "<cmd>lua require('telescope.builtin').lsp_references()<cr>", "References" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document symbols" },
    S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace symbols" },
  },
}

local opts = { prefix = "<leader>" }

which_key.setup {}
which_key.register(mappings, opts)
