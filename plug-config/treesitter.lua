require'nvim-treesitter.configs'.setup {
    -- Modules and its options go here
    highlight = { enable = true },
    incremental_selection = { enable = true },
    textobjects = { enable = true }
}
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.glsl = {
    used_by = {"conf", "vert", "frag"}
}
