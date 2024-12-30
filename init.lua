CONFIG = vim.fn.stdpath("config"):gsub("\\", "/")

-- Lazy (Package Manager)
require("config.lazy")

-- General settings
require("config.settings")

-- Tab navigation
vim.keymap.set("n", "<C-h>", require("config.tabs.navigate").move_left)
vim.keymap.set("n", "<C-l>", require("config.tabs.navigate").move_right)

-- Keys and mappings
vim.cmd("source " .. CONFIG .. "/mappings.vim")
