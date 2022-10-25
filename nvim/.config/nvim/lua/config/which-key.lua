local which_key = require('which-key')

local mappings = {
  ["<C-l>"] = { "<cmd>nohlsearch<CR>", "No highlight" },
  ["<leader>e"] = { "<cmd>NvimTreeFindFileToggle<CR>", "Explorer" },
  ["<leader>p"] = { "<cmd>PackerSync<CR>", "Packer sync" },

  ["<leader>a"] = {
    name = "Argument list",
    a = { "<cmd>argadd<CR>", "Add current buffer" },
    d = { "<cmd>argdelete %<CR>", "Delete current buffer" },
    l = { "<cmd>args<CR>", "Show the whole list" }
  },

  ["<leader>d"] = {
    name = "Diagnostics",
    d = { "<cmd>lua require('telescope.builtin').diagnostics()<CR>", "All" },
    l = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Line" },
    q = { "<cmd>lua vim.diagnostic.setloclist()<CR>", "Quickfix" },
  },

  ["<leader>f"] = {
    name = "Find",
    b = { "<cmd>lua require('telescope.builtin').buffers({previewer=false})<CR>", "Buffers", },
    c = { "<cmd>Telescope commands<CR>", "Commands" },
    f = { "<cmd>lua require('telescope.builtin').find_files({previewer=false})<CR>", "Files", },
    g = { "<cmd>Telescope git_status<CR>", "Changed files" },
    h = { "<cmd>Telescope help_tags<CR>", "Help" },
    k = { "<cmd>Telescope keymaps<CR>", "Keymaps" },
    m = { "<cmd>Telescope man_pages<CR>", "Man pages" },
    o = { "<cmd>lua require('telescope.builtin').oldfiles({previewer=false})<CR>", "Recent files" },
    r = { "<cmd>Telescope registers<CR>", "Registers" },
    t = { "<cmd>lua require('telescope.builtin').live_grep()<CR>", "Grep" },
  },

  ["<leader>g"] = {
    name = "Git",
    b = { "<cmd>lua require 'gitsigns'.blame_line()<CR>", "Blame" },
    g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<CR>", "Preview hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<CR>", "Reset hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<CR>", "Reset buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<CR>", "Stage hunk" },
    u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<CR>", "Undo stage hunk", },
  },

  ["<leader>j"] = {
    name = "Jump",
    j = { "<cmd>HopWord<CR>", "Word" },
    l = { "<cmd>HopLine<CR>", "Line" },
  },

  ["<leader>l"] = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code action" },
    d = {
      "<cmd>lua require('telescope.builtin').lsp_definitions({jump_type='never',show_line=false})<CR>",
      "Show Definitions"
    },
    f = { "<cmd>lua vim.lsp.buf.format()<CR>", "Format" },
    h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover info" },
    i = { "<cmd>LspInfo<CR>", "Info" },
    I = { "<cmd>LspInstallInfo<CR>", "Installer info" },
    r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
    s = { "<cmd>Telescope lsp_document_symbols<CR>", "Document symbols" },
    w = { "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", "Workspace symbols" },
  },

  ["[a"] = { "<cmd>prev<CR>", "Previous Argument" },
  ["[A"] = { "<cmd>first<CR>", "First Argument" },
  ["[b"] = { "<cmd>bprevious<CR>", "Previous Buffer" },
  ["[B"] = { "<cmd>bfirst<CR>", "First Buffer" },
  ["[c"] = { "<cmd>cprevious<CR>", "Previous Quickfix Item" },
  ["[C"] = { "<cmd>cfirst<CR>", "First Quickfix Item" },
  ["[d"] = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Previous Diagnostic" },
  ["[g"] = { "<cmd>lua require 'gitsigns'.prev_hunk()<CR>", "Prev Git hunk" },

  ["]a"] = { "<cmd>next<CR>", "Next Argument" },
  ["]A"] = { "<cmd>last<CR>", "Last Argument" },
  ["]b"] = { "<cmd>bnext<CR>", "Next Buffer" },
  ["]B"] = { "<cmd>blast<CR>", "Last Buffer" },
  ["]c"] = { "<cmd>cnext<CR>", "Next Quickfix Item" },
  ["]C"] = { "<cmd>clast<CR>", "Last Quickfix Item" },
  ["]d"] = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Next Diagnostic", },
  ["]g"] = { "<cmd>lua require 'gitsigns'.next_hunk()<CR>", "Next Git hunk" },

  ["gd"] = { "<cmd>lua require('telescope.builtin').lsp_definitions({show_line=false})<CR>", "Go to Definition" },
  ["gD"] = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Go to Declaration" },
  -- ["gi"] = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Go to Implementation" },
  ["gr"] = { "<cmd>lua require('telescope.builtin').lsp_references({show_line=false})<CR>", "Go to References" },
}

local opts = { prefix = "" }

which_key.setup {}
which_key.register(mappings, opts)
