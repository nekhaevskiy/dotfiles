-- vim.keymap.set("n", "<C-h>", "<C-w>h", { remap = true })
-- vim.keymap.set("n", "<C-j>", "<C-w>j", { remap = true })
-- vim.keymap.set("n", "<C-k>", "<C-w>k", { remap = true })
-- vim.keymap.set("n", "<C-l>", "<C-w>l", { remap = true })

vim.keymap.set({ "n", "i" }, "<esc>", "<cmd>noh<cr><esc>")

vim.keymap.set("n", "<leader>bb", "<cmd>e #<cr>")

vim.keymap.set("n", "]q", "<cmd>cnext<cr>")
vim.keymap.set("n", "[q", "<cmd>cprev<cr>")
