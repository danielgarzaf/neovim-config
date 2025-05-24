-- Tab controls
vim.keymap.set("n", "<M-n>", "<cmd>tabnew<CR>")
vim.keymap.set("n", "<M-h>", "<cmd>tabprev<CR>")
vim.keymap.set("n", "<M-l>", "<cmd>tabnext<CR>")
vim.keymap.set("n", "<M-w>", "<cmd>tabclose<CR>")

-- Quickfix
vim.keymap.set("n", "<M-o>", "<cmd>botright copen<CR>")
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")
vim.keymap.set("n", "<M-c>", "<cmd>cclose<CR>")


-- Source | Lua Execute
vim.keymap.set("n", "<space><space>x", "<cmd>w | source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")
