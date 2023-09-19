local keymap = vim.keymap

keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = "Open File Exporer" })

keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

keymap.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
keymap.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })

keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

keymap.set("n", "<leader>p", "<cmd>Lazy<cr>", { desc = "Lazy" })

keymap.set("n", "<leader>ll", "<cmd>lopen<cr>", { desc = "Location List" })
keymap.set("n", "[l", "<cmd>lprev<cr>zz", { desc = "Previous location item" })
keymap.set("n", "]l", "<cmd>lnext<cr>zz", { desc = "Next location item" })

keymap.set("n", "<leader>qq", "<cmd>copen<cr>", { desc = "Quickfix List" })
keymap.set("n", "[q", "<cmd>cprev<cr>zz", { desc = "Previous quickfix" })
keymap.set("n", "]q", "<cmd>cnext<cr>zz", { desc = "Next quickfix" })

keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Keep cursor in the middle while scrolling down" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Keep cursor in the middle while scrolling up" })

keymap.set("n", "n", "nzzzv", { desc = "Keep cursor in the middle while search forward" })
keymap.set("n", "N", "Nzzzv", { desc = "Keep cursor in the middle while search backward" })

keymap.set("x", "<leader>p", [["_dP]], { desc = "Put the previous word to the void register when pasting" })

keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete to the void register" })

keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy to the system clipboard" })
keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy the line to the system clipboard" })

keymap.set("n", "<leader>x", "<cmd>!chmod +x %<cr>", { desc = "Make the file executable", silent = true })

-- keymap.set("n", "<leader>f", vim.lsp.buf.format)
-- keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
