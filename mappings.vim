let g:mapleader = " "

" Jump between windows
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>

" Quick vsplit/split
nnoremap <leader>vs :vsplit <CR> 
nnoremap <leader>s :split<CR>

" Resizing windows
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>

" Better indentation
vnoremap < <gv
vnoremap > >gv
vnoremap <C-c> "*y

" Yank rest of line
nnoremap Y y$

" Center line when doing "/" search
nnoremap n nzzzv
nnoremap N Nzzzv

" Join next line into current line
nnoremap J mzJ`z

" Scroll up/down with 5 lines of space
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" Move current selection of VISUAL mode (line or regular mode) up/down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Insert space down from current line without going into insert mode
nnoremap <leader><CR> mzo<Esc>`z

" Built in file browser
nnoremap <leader>pv :Ex<CR>

function! SwitchSlash(start, end, range) abort
    let lines = getline(a:start, a:end)
    for i in range(len(lines))
        if stridx(lines[i], "\\") >= 0
            call setline(a:start + i, substitute(lines[i], "\\\\", "/", "g"))
        else
            call setline(a:start + i, substitute(lines[i], "/", "\\\\", "g"))
        endif
    endfor
endfunction
command! -range SwitchSlash call SwitchSlash(<line1>, <line2>, <range>)
vnoremap <silent><leader>z :SwitchSlash<CR>gv


