-- Tab controls
vim.keymap.set("n", "<C-n>", "<cmd>tabnew<CR>")
vim.keymap.set("n", "<C-h>", "<cmd>tabprev<CR>")
vim.keymap.set("n", "<C-l>", "<cmd>tabnext<CR>")
vim.keymap.set("n", "<C-w>", "<cmd>tabclose<CR>")

-- Quickfix
vim.keymap.set("n", "<M-o>", "<cmd>botright copen<CR>")
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")
vim.keymap.set("n", "<M-c>", "<cmd>cclose<CR>")
