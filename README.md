# neovim-config
Personal Neovim configurations
## Step 1:
Install Neovim. Make sure it's 0.8.0 or higher.
Check [Building-Neovim](https://github.com/neovim/neovim/wiki/Building-Neovim) 
if you want the most recent version of Neovim (pay close attention to the 
prerequesites and installation process according to your platform)


>NOTE: I recommend using scoop for installing most dependencies on Windows. Run this from powershell
>```ps1
>Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time
>irm get.scoop.sh | iex
>```
>Restart powershell and run this
>```ps1
>scoop install neovim nodejs # NodeJS is used by some plugins. There are more packages you're going to need for some plugins (WIP)
>```


## Step 2:
Go to [Node Installation](https://github.com/nodesource/distributions/blob/master/README.md#debinstall) 
and follow the steps at the `Installation instructions` section to install Node.js 
on your machine (keep your OS in mind for which instructions to follow)
## Step 3:
Make sure to use the respective command for your platform to clone the repo in the correct location with the correct name
- Windows
```
git clone https://github.com/danielgarzaf/neovim-config $env:LOCALAPPDATA\nvim
```
- Linux
```
git clone https://github.com/danielgarzaf/neovim-config ~/.config/nvim
```
## Step 4:
Using Neovim, open `plugins.vim` and run the command `:PlugInstall`
