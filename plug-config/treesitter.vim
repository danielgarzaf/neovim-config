" if !exists('g:loaded_nvim_treesitter')
"     finish
" endif

lua <<EOF
require'nvim-treesitter.configs'.setup {
    -- Modules and its options go here
    highlight = { enable = true },
    incremental_selection = { enable = true },
    textobjects = { enable = true },
ensure_installed = {
    "tsx",
    "c",
    "json",
    "lua",
    "vim"
    }
}
EOF
