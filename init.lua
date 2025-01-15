CONFIG = vim.fn.stdpath("config"):gsub("\\", "/")

require("config.lazy") -- Package manager
require("config.settings")
require("config.mappings")
require("config.autocommands")

-- Legacy mappings
vim.cmd("source " .. CONFIG .. "/mappings.vim")
vim.cmd("source " .. CONFIG .. "/terminal.vim")

function Exists(file)
    local ok, err, code = os.rename(file, file)
    if not ok and code == 13 then
        return true -- permission denied, but it exists
    end
    return ok, err
end

function IsDir(path)
    return Exists(path .. "/")
end
