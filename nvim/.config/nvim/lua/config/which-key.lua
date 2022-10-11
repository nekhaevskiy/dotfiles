local which_key = require('which-key')

local mappings = {
  ["<leader>/"] = { "<cmd>nohlsearch<cr>", "No highlight" },
  ["<leader>e"] = { "<cmd>NvimTreeFindFileToggle<cr>", "Explorer" },
  ["<leader>p"] = { "<cmd>PackerSync<cr>", "Packer sync" },

  ["<leader>a"] = {
    name = "Argument list",
    a = { "<cmd>argadd<cr>", "Add current buffer" },
    d = { "<cmd>argdelete %<cr>", "Delete current buffer" },
    l = { "<cmd>args<cr>", "Show the whole list"}
  },

  ["<leader>d"] = {
    name = "Diagnostics",
    d = { "<cmd>lua require('telescope.builtin').diagnostics()<cr>", "All" },
    l = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Line" },
    q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
  },

  ["<leader>f"] = {
    name = "Find",
    b = { "<cmd>lua require('telescope.builtin').buffers({previewer=false})<cr>", "Buffers", },
    c = { "<cmd>Telescope commands<cr>", "Commands" },
    f = { "<cmd>lua require('telescope.builtin').find_files({previewer=false})<cr>", "Files", },
    g = { "<cmd>Telescope git_status<cr>", "Changed files" },
    h = { "<cmd>Telescope help_tags<cr>", "Help" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    m = { "<cmd>Telescope man_pages<cr>", "Man pages" },
    o = { "<cmd>lua require('telescope.builtin').oldfiles({previewer=false})<cr>", "Recent files" },
    r = { "<cmd>Telescope registers<cr>", "Registers" },
    t = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Grep" },
  },

  ["<leader>g"] = {
    name = "Git",
    b = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage hunk" },
    u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo stage hunk", },
  },

  ["<leader>j"] = {
    name = "Jump",
    j = { "<cmd>HopWord<cr>", "Word" },
    l = { "<cmd>HopLine<cr>", "Line" },
  },

  ["<leader>l"] = {
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

  ["[a"] = { "<cmd>prev<CR>", "Previous Argument" },
  ["[A"] = { "<cmd>first<CR>", "First Argument" },
  ["[b"] = { "<cmd>bprevious<CR>", "Previous Buffer" },
  ["[B"] = { "<cmd>bfirst<CR>", "First Buffer" },
  ["[d"] = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Previous Diagnostic" },
  ["[g"] = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Git hunk" },

  ["]a"] = { "<cmd>next<CR>", "Next Argument" },
  ["]A"] = { "<cmd>last<CR>", "Last Argument" },
  ["]b"] = { "<cmd>bnext<CR>", "Next Buffer" },
  ["]B"] = { "<cmd>blast<CR>", "Last Buffer" },
  ["]d"] = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Next Diagnostic", },
  ["]g"] = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Git hunk" },
}

local opts = { prefix = "" }

which_key.setup {}
which_key.register(mappings, opts)
