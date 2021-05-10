let mapleader = " "

" Jump between windows
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>l :wincmd l<CR>

" Quick vsplit/split
nnoremap <leader>vs :vsplit<CR>
nnoremap <leader>s :split<CR>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" TAB/Shift+TAB to cycle between text buffers
nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprevious<CR>

" Ctrl+[ instead of Esc
nnoremap <C-[> <Esc> 
vnoremap <C-[> <Esc>

"nnoremap <C-!> ^<CR>
