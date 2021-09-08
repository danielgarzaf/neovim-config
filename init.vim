source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/colors/color-scheme.vim
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/keys/autocomment.vim
source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/treesitter.vim

lua << EOF
require'lspconfig'.groovyls.setup{
    -- Unix
    cmd = { "java", "-jar", "~/groovy-language-server/build/lib/groovy-language-server-all.jar"}
}
EOF

