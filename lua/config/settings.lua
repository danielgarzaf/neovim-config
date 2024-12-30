vim.cmd("let $LANG = 'en'")

local set = vim.cmd.set
set("nohlsearch")
set("noerrorbells")
set("nowrap")
set("noswapfile")
set("nobackup")
set("nowritebackup")
set("noshowmode")
set("colorcolumn=80")

set = vim.opt
set.wildignore:append("*.pyc")
set.wildignore:append("*_build/*")
set.wildignore:append("**/coverage/*")
set.wildignore:append("**/node_modules/*")
set.wildignore:append("**/android/*")
set.wildignore:append("**/ios/*")
set.wildignore:append("**/.git/*")
set.wildignore:append("**.exe")
set.wildignore:append("**.hex")
set.wildignore:append("**.cfg")
set.wildignore:append("**.elf")
set.shortmess:append("c")

set.exrc = true
set.relativenumber = true

set.hidden = true
set.expandtab = true
set.smartindent = true
set.nu = true
set.smartcase = true
set.termguicolors = true
set.autoread = true
set.undofile = true
set.incsearch = true
set.showmode = true

set.guicursor = "a:blinkon100"
set.undodir = CONFIG .. "/undodir"
set.completeopt = { "menuone", "noinsert", "noselect" }
set.signcolumn = "number"
set.inccommand = "split"

set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.scrolloff = 8
set.cmdheight = 2
set.updatetime = 50
