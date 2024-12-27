CONFIG = vim.fn.stdpath("config"):gsub("\\", "/")

-- General settings
require("config.settings")

-- Keys and mappings
vim.cmd("source " .. CONFIG .. "/mappings.vim")

-- Lazy (Package Manager)
require("config.lazy")
