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
in Neovim, then close and relaunch

## Dependencies

### Font
[DejaVuSansMono Nerd Font Mono](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/DejaVuSansMono/Regular/complete)
Any Nerd Font should probably work

### Wakatime
Fill in your [API key](https://wakatime.com/settings/api-key) when the plugin asks for it

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
### Git
```
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh
```
also setup `gh auth`

### Neoclip
```
sudo apt install sqlite3 libsqlite3-dev
```

### Other stuff
```
pip install ropevim
sudo apt install ripgrep
```

## Known Problems
On different pc fzf extension for telescope doesn't work, fix is to comment that part out.

## Minor annoyances to fix
* Telescope keybinds
* Floaterm cutting off output
* Folds in markdown
* Bullet points in markdown being 1 tab level deeper

## Maybelookats
* [octo](https://github.com/pwntester/octo.nvim)
* [himalaya](https://github.com/soywod/himalaya)
* [agenda](https://github.com/dhruvasagar/vim-dotoo)
* [org-mode](https://github.com/vimoutliner/vimoutliner)
