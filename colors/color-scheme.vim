if exists('&termguicolors') && exists("&winblend")
    syntax enable
    set winblend=0
    set wildoptions=pum
    set pumblend=5
    set background=dark
    let g:gruvbox_contrast_dark='hard'
"     let g:gruvbox_transparent_bg=1
    autocmd VimEnter * hi Normal ctermbg=none guibg=none
    colorscheme gruvbox
endif
