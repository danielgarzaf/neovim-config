nmap <C-p> ;g
nnoremap <silent> ;g :Telescope git_files<CR>
nnoremap <silent> ;f :Telescope find_files<CR>
nnoremap <silent> ;r :Telescope live_grep<CR>
nnoremap <silent> \\ :Telescope buffers<CR>
nnoremap <silent> ;; :Telescope help_tags<CR>
nnoremap <silent> ;o :Telescope coc document_symbols<CR>

lua <<EOF
local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        mappings = {
            n = {
                ["q"] = actions.close
            },
        }
    }
}
require('telescope').load_extension('fzf')
require('telescope').load_extension('coc')
EOF
