let $CONFIG = $HOME."/.config/nvim"
if has('win32')
    let $CONFIG = substitute($LOCALAPPDATA."/nvim", "\\", "/", "g")
endif
let $PLUGINS = '~/.local/share/nvim/site/autoload'

" General settings
source $CONFIG/settings.vim

" Plugs
source $CONFIG/plugins.vim

" Keys and mappings
source $CONFIG/mappings.vim

" Plug config
source $CONFIG/plug-config/lspconfig.lua
source $CONFIG/plug-config/cmp.lua
source $CONFIG/plug-config/lualine.lua
source $CONFIG/plug-config/treesitter.lua
source $CONFIG/plug-config/telescope.lua
source $CONFIG/plug-config/web-devicons.lua

" Colors
source $CONFIG/color-scheme.lua

