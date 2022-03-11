" lars-vc's config file
"    ___  __  ________  ________   ___    ___    _   ________ 
"  ╱╱   ╲╱  ╲╱    __  ╲╱   ___  ╲ ╱   ╲  ╱   ╲  ╱_╱ ╱        ╲
" ╱╱        ╱    __╱  ╱      ╱  ╱ ╲    ╲╱    ╱___  ╱         ╱
"╱         ╱     ____╱   ___╱  ╱   ╲        ╱╱   ╱╱   ╱  ╱  ╱ 
"╲__╱╲____╱╲________╱╲________╱     ╲______╱╱___╱ ╲__╱__╱__╱  

"===========================================================
"---------------------------Basic---------------------------
"===========================================================
syntax on               " enables syntax highlighting
set termguicolors       " better colors
set tabstop=4           " number of spaces in a <Tab>
set shiftwidth=4        " 
set softtabstop=4       " 
set expandtab           " 
set smartindent         " enable autoindents
set number              " adds line numbers
set relativenumber      " relative numbers in sidebar
set numberwidth=4       " columns used for the line number
set incsearch           " highlighting matched strings while searching
set nohlsearch          " no remaining highlights on search
set noea                " splitting windows
set hidden              " navigate buffers without losing unsaved work
set scrolloff=8         " start scrolling when 8 lines from top or bottom
set undofile            " save undo history
set mouse=a             " enable mouse support
set ignorecase          " case insensitive search unless capital letters are used
set smartcase           " 
set nrformats+=alpha    " increment letters
set timeoutlen=500      " for whichkey to show up quicker
set spelllang=en,nl     " spelling for certain files
"===========================================================
"--------------------------Keymaps--------------------------
"===========================================================
inoremap jk <Esc>
nnoremap <SPACE> <Nop>
let mapleader = " "
" navigating plugins
inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"
inoremap <silent><expr> <Tab> pumvisible() ? coc#_select_confirm() : "\<Tab>"
nnoremap <F1> <C-w>w
" moving in insert mode
inoremap <A-h> <Left>
inoremap <A-j> <Down>
inoremap <A-k> <Up>
inoremap <A-l> <Right>
" moving around windows
map <A-H> <C-w>h
map <A-J> <C-w>j
map <A-K> <C-w>k
map <A-L> <C-w>l
" moving around tabs
nnoremap <F2> gT
nnoremap <F3> gt
" closing stuff
nnoremap <leader>xt :wa<cr>:tabclose<cr>
nnoremap <leader>xx :wa<cr>:qa<cr>
nnoremap <leader>xq :qa!<cr>
:command Cheat tabedit ~/.config/nvim/cheatsheet.vim
"===========================================================
"--------------------------Plugins--------------------------
"===========================================================
" making sure vim-plug is installed
if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif
" Vim-plug
call plug#begin('~/.config/nvim/plugged')
" --Theme--
Plug 'marko-cerovac/material.nvim'
" --Telescope--
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make' }
Plug 'kyazdani42/nvim-web-devicons'
" --Airline--
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" --Vim-Fugitive--
Plug 'tpope/vim-fugitive'
" --COC--
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" --Nerd tree--
Plug 'preservim/nerdtree'
" --Better scrolling--
Plug 'psliwka/vim-smoothie'
" --Terminal--
Plug 'voldikss/vim-floaterm'
" --Auto pairs--
Plug 'jiangmiao/auto-pairs'
" Plug 'LunarWatcher/auto-pairs'
" Plug 'tpope/vim-surround'
" --Treeshitter--
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" --Commenting (gcc)--
Plug 'tpope/vim-commentary'
" --Git stuff--
Plug 'airblade/vim-gitgutter'
" --Wakatime--
Plug 'wakatime/vim-wakatime'
" --Debugger--
Plug 'puremourning/vimspector'
" --Tree icons--
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
" --Lightspeed--
Plug 'ggandor/lightspeed.nvim'
Plug 'tpope/vim-repeat'
" --Neoclip--
Plug 'AckslD/nvim-neoclip.lua'
Plug 'tami5/sqlite.lua'
" --Sessions--
Plug 'jistr/vim-nerdtree-tabs'
" --Practise--
Plug 'ThePrimeagen/vim-be-good'
" --TagBar--
Plug 'preservim/tagbar'
" --Kotlin--
Plug 'udalov/kotlin-vim'
" --WhichKey--
Plug 'folke/which-key.nvim'
" --Aligning text--
Plug 'godlygeek/tabular'
" --Markdown
Plug 'preservim/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
call plug#end()
"===========================================================
"--------------------------Colours--------------------------
"===========================================================
colorscheme material
let g:material_style = 'oceanic'
"===========================================================
"-----------------------Plugin Setups-----------------------
"===========================================================
"//////////////////////////Airline\\\\\\\\\\\\\\\\\\\\\\\\\\
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline_theme='deus'
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#tabline#enabled = 1
set updatetime=100
set noshowmode
"\\\\\\\\\\\\\\\\\\\\\\\\\\______//////////////////////////

"/////////////////////////NERDtree\\\\\\\\\\\\\\\\\\\\\\\\\\
autocmd VimEnter * NERDTree | wincmd p
autocmd VimEnter * if argc() == 1 | execute 'NERDTree' | wincmd p | endif
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
nnoremap <leader>nt :NERDTreeMirrorToggle<CR>
nnoremap <leader>nc :NERDTreeClose<CR>
nnoremap <leader>no :NERDTreeMirrorOpen<CR>
nnoremap <leader>nat :NERDTreeTabsToggle<CR>
nnoremap <leader>nac :NERDTreeTabsClose<CR>
nnoremap <leader>nao :NERDTreeTabsOpen<CR>
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
"\\\\\\\\\\\\\\\\\\\\\\\\\_______//////////////////////////

"/////////////////////////Floaterm\\\\\\\\\\\\\\\\\\\\\\\\\\
" Save all tabs when opening terminal
nnoremap   <silent>   <F12>   :wa<CR>:FloatermToggle<CR>
tnoremap   <silent>   <F12>   <C-\><C-n>:FloatermToggle<CR>
nnoremap   <silent>   ²       :wa<CR>:FloatermToggle<CR>
tnoremap   <silent>   ²       <C-\><C-n>:FloatermToggle<CR>
let g:floaterm_height=0.95
let g:floaterm_width=0.8
"\\\\\\\\\\\\\\\\\\\\\\\\\_______//////////////////////////

"///////////////////////////COC\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
set cmdheight=2
set signcolumn=yes
autocmd CursorHold * silent call CocActionAsync('highlight')
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Autoformatting with coc
let g:python3_host_prog="/usr/bin/python3"
au BufWrite * :call CocAction('format')
noremap <C-A-l> :call CocAction('format')<CR>
" GoTo code navigation.
nmap <silent> <leader>cd <Plug>(coc-definition)
nmap <silent> <leader>cy <Plug>(coc-type-definition)
nmap <silent> <leader>ci <Plug>(coc-implementation)
nmap <silent> <leader>cr <Plug>(coc-references)
nnoremap <silent> <leader>ct :call <SID>show_documentation()<CR>
" show documentation on hover and SPC ct
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>ca  <Plug>(coc-codeaction-selected)
" Remap keys for applying codeAction to the current buffer.
nmap <leader>ca  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>cf  <Plug>(coc-fix-current)
" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)
" Extensions
let g:coc_global_extensions = ["coc-clangd", "coc-html", "coc-java", "coc-json", "coc-kotlin", "coc-pyright", "coc-rls", "coc-tsserver"]
"\\\\\\\\\\\\\\\\\\\\\\\\\\\___/////////////////////////////

"////////////////////////Treesitter\\\\\\\\\\\\\\\\\\\\\\\\\
lua <<EOF
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        custom_captures = {
                ["foo.bar"] = "Identifier",
        },
        additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
}
EOF
"\\\\\\\\\\\\\\\\\\\\\\\\__________/////////////////////////

"/////////////////////////Telescope\\\\\\\\\\\\\\\\\\\\\\\\\
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fc <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fn <cmd>Telescope neoclip plus<cr><Esc>
lua <<EOF
require('telescope').load_extension('fzf')
require('telescope').setup {
    pickers = {
        find_files = {
            path_display = {"truncate"},
            color_devicons=true,
        },
        live_grep = {
            path_display = {"shorten"},
        },
    },
    defaults = {
        layout_config = {
            horizontal = {
                height= 0.95,
                width= 0.95,
            },
            center = {
                height= 0.95,
                width= 0.95,
            }
        },
    },
    mappings = {
        i = {
            ["<C-j>"] = "<C-n>",
            ["<C-k>"] = "<C-p>",
        }
    }
}
require('neoclip').setup {
    enable_persistent_history = true
}
EOF
"\\\\\\\\\\\\\\\\\\\\\\\\\_________/////////////////////////

"///////////////////////////Lua\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
lua <<EOF
require('nvim-web-devicons').setup {
    default = true;
}
require('which-key').setup {
    plugins = {
        spelling = {
            enabled = true,
            suggestions = 20,
        }
    }
}
EOF
"\\\\\\\\\\\\\\\\\\\\\\\\\\\___/////////////////////////////

"////////////////////////Vimspector\\\\\\\\\\\\\\\\\\\\\\\\\
let g:vimspector_code_minwidth = 90
let g:vimspector_terminal_maxwidth = 75
let g:vimspector_terminal_minwidth = 20
" Debug launch window setup (hacky but works)
nmap <leader>dd :call vimspector#Launch()<CR>:NERDTreeClose<CR>2<C-w>j:q<CR> 
nmap <leader>dx :call vimspector#Reset()<CR>
nnoremap <leader>dX :call vimspector#ClearBreakpoints()<CR>
nnoremap <S-k> :call vimspector#StepOut()<CR>
nnoremap <S-l> :call vimspector#StepInto()<CR>
nnoremap <S-j> :call vimspector#StepOver()<CR>
nnoremap <leader>d_ :call vimspector#Restart()<CR>
nnoremap <leader>dn :call vimspector#Continue()<CR>
nnoremap <leader>drc :call vimspector#RunToCursor()<CR>
nnoremap <leader>dh :call vimspector#ToggleBreakpoint()<CR>
nnoremap <leader>de :call vimspector#ToggleConditionalBreakpoint()<CR>
let g:vimspector_install_gadgets = ['debugpy', 'vscode-cpptools', 'CodeLLDB', 'vscode-node-debug2']
" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval
"\\\\\\\\\\\\\\\\\\\\\\\\__________/////////////////////////

"///////////////////////Vim-fugitive\\\\\\\\\\\\\\\\\\\\\\\\
nnoremap <leader>gg :Git 
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gc :Git commit -a -m ""<Left>
" for merge conflicts
nnoremap <leader>gh :diffget //2<CR>
nnoremap <leader>gl :diffget //3<CR>
"\\\\\\\\\\\\\\\\\\\\\\\____________////////////////////////

"/////////////////////////Markdown\\\\\\\\\\\\\\\\\\\\\\\\\\
nnoremap <leader>mp :MarkdownPreview<CR>
nnoremap <leader>ms :MarkdownPreviewStop<CR>
nnoremap <leader>mt :MarkdownPreviewToggle<CR>
" take first spellingfix
nnoremap <leader>s 1z=
let g:vim_markdown_folding_disabled = 1
autocmd FileType markdown setlocal spell
"\\\\\\\\\\\\\\\\\\\\\\\\\________//////////////////////////

"//////////////////////////Other\\\\\\\\\\\\\\\\\\\\\\\\\\\\
" Autopair
let g:AutoPairsCenterLine = 0
" Gitgutter
:au VimEnter * :GitGutterSignsDisable
" Nerd tree icons
set conceallevel=3
" Prolog
au FileType perl set filetype=prolog
" TagBar
nnoremap <F8> :TagbarToggle<CR>
let g:tagbar_map_nexttag = '<C-j>'
let g:tagbar_map_prevtag = '<C-k>'
" Z Lua script
" lua require('lars-vc')
"\\\\\\\\\\\\\\\\\\\\\\\\\\_____////////////////////////////
