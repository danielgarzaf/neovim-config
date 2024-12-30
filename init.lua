CONFIG = vim.fn.stdpath("config"):gsub("\\", "/")

-- Lazy (Package Manager)
require("config.lazy")

-- General settings
require("config.settings")

-- Keys and mappings
vim.cmd("source " .. CONFIG .. "/mappings.vim")
