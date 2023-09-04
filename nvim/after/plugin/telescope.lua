local status_telescope, telescope = pcall(require, "telescope")
if (not status_telescope) then return end

telescope.setup {
    defaults = {
        layout_strategy = "vertical"
    }
}

local status_builtin, builtin = pcall(require, "telescope.builtin")
if (not status_builtin) then return end

vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})
