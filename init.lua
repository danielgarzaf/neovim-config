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

CONFIG = os.getenv("HOME") .. "/.config/nvim/"
if get_os() == "Windows" then
    CONFIG = os.getenv("LOCALAPPDATA") .. "/nvim/"
    CONFIG = CONFIG:gsub("\\", "/")
end

local function source_file(dir, file)
    vim.cmd("source " .. dir .. file)
end

-- General settings
require("config.settings")

-- Keys and mappings
source_file(CONFIG, "mappings.vim")

-- Lazy (Package Manager)
require("config.lazy")
