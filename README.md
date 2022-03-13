# NeoVim configfiles

## TOC
* [Install](#install)
* [Dependencies](#dependencies)
  * [Font](#font)
  * [Wakatime](#wakatime)
  * [Node](#node)
  * [Python3](#python3)
  * [Tag bar](#tag-bar)
  * [Git](#git)
  * [Neoclip](#neoclip)
  * [Other stuff](#other-stuff)
* [Known Problems](#known-problems)
* [All plugins](#all-plugins)
* [Minor annoyances to fix](#minor-annoyances-to-fix)
* [Maybelookats](#maybelookats)

## Install
First install [NeoVim](https://github.com/neovim/neovim), this can be done like so:
```
sudo apt install neovim
```

Sometimes the ubuntu version might run behind, fix that by adding this [stable ppa](https://code.launchpad.net/~neovim-ppa/+archive/ubuntu/stable) or this [unstable ppa](https://code.launchpad.net/~neovim-ppa/+archive/ubuntu/unstable):
```
sudo add-apt-repository ppa:neovim-ppa/stable
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
in NeoVim, then close and relaunch

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

### Tag bar
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

### Treesitter
Need to install languages manually currently maybe also need a dependency `libstdc++`
```
:TSInstall lang
```

### Other stuff
```
pip install ropevim
sudo apt install ripgrep
```

## Known Problems

### fzf
On different pc fzf extension for telescope doesn't work, fix is:
```shell
cd plugged/telescope-fzf-native.nvim
make
```

### cause
If you get weird errors while typing cause just rm the plugged directory and do
```
:PlugInstall
```

## All plugins

* [Material theme](https://github.com/marko-cerovac/material.nvim/)
* [Telescope](https://github.com/nvim-telescope/telescope.nvim/)
    * [Plenary](https://github.com/nvim-lua/plenary.nvim/)
    * [fzf extension](https://github.com/nvim-telescope/telescope-fzf-native.nvim')
    * [Icons in Telescope](https://github.com/kyazdani42/nvim-web-devicons/)
* [Airline status bar](https://github.com/vim-airline/vim-airline/)
    * [Airline themes](https://github.com/vim-airline/vim-airline-themes/)
* [Fugitive git wrapper](https://github.com/tpope/vim-fugitive/)
* [Conquer of Completion](https://github.com/neoclide/coc.nvim)
* [NERDtree](https://github.com/preservim/nerdtree/)
    * [Colour in NERDtree](https://github.com/tiagofumo/vim-nerdtree-syntax-highlight/)
    * [Icons in NERDtree](https://github.com/ryanoasis/vim-devicons/)
    * [Close all NERDtree buffers at once](https://github/jistr/vim-nerdtree-tabs/)
* [Smooth scrolling](https://github.com/psliwka/vim-smoothie/)
* [Floating Terminal](https://github.com/voldikss/vim-floaterm/)
* [Bracket matching](https://github.com/jiangmiao/auto-pairs/)
* [Tree sitter](https://github.com/nvim-treesitter/nvim-treesitter)
* [Easier commenting](https://github.com/tpope/vim-commentary/)
* [Git gutter](https://github.com/airblade/vim-gitgutter/)
* [Wakatime](https://github.com/wakatime/vim-wakatime/)
* [Debugging](https://github.com/puremourning/vimspector/)
* [Moving around files with light speed](https://github.com/ggandor/lightspeed.nvim/)
    * [Repeating actions](https://github.com/tpope/vim-repeat/)
* [Visual clipboard](https://github/AckslD/nvim-neoclip.lua/)
    * [Persisting clipboard](https://github/tami5/sqlite.lua/)
* [Key practise](https://github/ThePrimeagen/vim-be-good/)
* [Tag bar](https://github/preservim/tagbar/)
* [Kotlin syntax highlighting](https://github/udalov/kotlin-vim/)
* [Which key](https://github/folke/which-key.nvim/)
* [Tabular](https://github/godlygeek/tabular/)
* [Markdown additions](https://github/preservim/vim-markdown/)
    * [Markdown preview](https://github/iamcco/markdown-preview.nvim/)

## Minor annoyances to fix
* Floaterm cutting off output

## Maybelookats
* [octo](https://github.com/pwntester/octo.nvim)
* [himalaya](https://github.com/soywod/himalaya)
* [agenda](https://github.com/dhruvasagar/vim-dotoo)
* [org-mode](https://github.com/vimoutliner/vimoutliner)
