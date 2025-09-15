return {
  'neovim/nvim-lspconfig',
  config = function()
    vim.lsp.config('vtsls', {
      root_dir = function(bufnr, on_dir)
        -- The project root is where the LSP can be started from
        -- As stated in the documentation above, this LSP supports monorepos and simple projects.
        -- We select then from the project root, which is identified by the presence of a package
        -- manager lock file.
        local root_markers = { 'package-lock.json', 'yarn.lock', 'pnpm-lock.yaml', 'bun.lockb', 'bun.lock', '.git' }
        -- Give the root markers equal priority by wrapping them in a table
        root_markers = vim.fn.has 'nvim-0.11.3' == 1 and { root_markers } or root_markers
        local project_root = vim.fs.root(bufnr, root_markers)
        if not project_root then
          return
        end

        on_dir(project_root)
      end,
    })
  end,
}
