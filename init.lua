CONFIG = vim.fn.stdpath("config"):gsub("\\", "/")

require("config.lazy") -- Package manager
require("config.settings")
require("config.mappings")
require("config.autocommands")

-- Legacy mappings
vim.cmd("source " .. CONFIG .. "/mappings.vim")
