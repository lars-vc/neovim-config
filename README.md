# NeoVim configfiles

## Install
First install [NeoVim](https://github.com/neovim/neovim), this can be done like so:
```
sudo apt install neovim
```

Sometimes the ubuntu version might run behind, fix that by adding this [ppa](https://code.launchpad.net/~neovim-ppa/+archive/ubuntu/unstable):
```
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt upgrade
```

Then add the config by cloning in ~/.config/nvim
```
mkdir -p ~/.config/nvim/
cd ~/.config/nvim/
git clone https://github.com/lars-vc/neovim-config .
```

Finally run nvim, you will get a lot of errors on startup but this is normal! Run:
```
:PlugInstall
```
in neovim, close and relaunch

## Dependencies

### Font
[DejaVuSansMono Nerd Font Mono](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/DejaVuSansMono/Regular/complete)
Any NerdFont should probably work

### Wakatime
Fill in your [API-key](https://wakatime.com/settings/api-key) when the plugin asks for it

### Node
```
sudo apt install npm
sudo npm cache clean -f
sudo npm install -g n
sudo n stable
```

### Python3
```
sudo apt install python3
sudo apt install python3-pip
```

### Tagbar
```
sudo apt install exuberant-ctags
```

### Other stuff
```
pip install ropevim
sudo apt install ripgrep
```


## Minor annoyances to fix
* SQLite for neoclip
* telescope devicons
* Floatterm cutting off output

## Maybelookats
* octo.nvim
