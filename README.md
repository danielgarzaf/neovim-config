# neovim-config
Personal Neovim configurations
## Step 1:
Install Neovim. Make sure it's 0.4.4 or higher.
Check [Building-Neovim](https://github.com/neovim/neovim/wiki/Building-Neovim) if you want to 
install the most recent version of Neovim (pay close attention to the prerequesites
and installation process according to your platform)
## Step 2:
Go to [Node Installation](https://github.com/nodesource/distributions/blob/master/README.md#debinstall) 
and follow the steps at the `Installation instructions` section to install Node.js 
on your machine 
## Step 3:
From `~/.config`, clone this repo using `git clone https://github.com/danielgarzaf/neovim-config`
## Step 4:
Rename the directory of the repository to nvim (use `mv neovim-config/ nvim/`)
## Step 5:
Using Neovim enter the plugin files at `~/.config/nvim/vim-plug/plugins.vim` and
run the command `:PlugInstall` to install all the plugins in listed
