-- Tab controls
vim.keymap.set("n", "<C-n>", "<cmd>tabnew<CR>")
vim.keymap.set("n", "<C-h>", require("config.tabs.navigate").move_left)
vim.keymap.set("n", "<C-l>", require("config.tabs.navigate").move_right)

-- Quickfix
vim.keymap.set("n", "<M-o>", "<cmd>botright copen<CR>")
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")
vim.keymap.set("n", "<M-c>", "<cmd>cclose<CR>")
