local function get_os()
    if jit then
        return jit.os
    end

    -- Unix Linux variants
    local fh, err = assert(io.popen("uname -o 2 > /dev/null", "r"))
    local os = ""
    if not err then
        os = fh:read()
    end

    return os or "Windows"
end

local config = os.getenv("HOME") .. "/.config/nvim/"
if get_os() == "Windows" then
    config = os.getenv("LOCALAPPDATA").."/nvim/"
    config = g:gsub("\\", "/")
end

local function source_file(dir, file)
    vim.cmd("source " .. dir .. file)
end

-- General settings
source_file(config, "settings.vim")

-- Plugs
source_file(config, "plugins.vim")

-- Keys and mappings
source_file(config, "mappings.vim")

-- Lazy (Package Manager)
require("config.lazy")

-- Plugin configs
require("config.cmp")
require("config.lspconfig")
require("config.lualine")
require("config.treesitter")
require("config.telescope")
require("config.web-devicons")
require("config.color-scheme")
