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
Clone this repo using `git clone https://github.com/danielgarzaf/neovim-config` in the correct path:
| Windows | Linux |
| ----------- | ----------- |
| `$HOME\AppData\Local`  | `~/.config`|
## Step 4:
Rename the directory of the repository from `neovim-config` to `nvim`
## Step 5:
Using Neovim enter the plugin files at `nvim/plugins.vim` and run the command `:PlugInstall` to install 
all the plugins in listede
