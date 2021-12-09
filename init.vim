" lars-vc's config file
"    ___  __  ________  ________   ___    ___    _   ________ 
"  ╱╱   ╲╱  ╲╱    __  ╲╱   ___  ╲ ╱   ╲  ╱   ╲  ╱_╱ ╱        ╲
" ╱╱        ╱    __╱  ╱      ╱  ╱ ╲    ╲╱    ╱____ ╱         ╱
"╱         ╱     ____╱   ___╱  ╱   ╲        ╱╱   ╱╱   ╱  ╱  ╱ 
"╲__╱╲____╱╲________╱╲________╱     ╲______╱╱___╱ ╲__╱__╱__╱  

"===========================================================
"---------------------------Basic---------------------------
"===========================================================
" enables syntax highlighting
syntax on
" Better colors
set termguicolors
" number of spaces in a <Tab>
set tabstop=4
set softtabstop=4
set expandtab
" enable autoindents
set smartindent
" adds line numbers
set number
set relativenumber
" columns used for the line number
set numberwidth=4
" highlights the matched text pattern when searching
set incsearch
set nohlsearch
" open splits intuitively
set splitbelow
set splitright
" navigate buffers without losing unsaved work
set hidden
" start scrolling when 8 lines from top or bottom
set scrolloff=8
" Save undo history
set undofile
" Enable mouse support
set mouse=a
" case insensitive search unless capital letters are used
set ignorecase
set smartcase
" Use system clipboard
"set clipboard+=unnamedplus


"===========================================================
"--------------------------Keymaps--------------------------
"===========================================================
inoremap jk <Esc>
inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"
inoremap <expr> <Tab> pumvisible() ? "\<C-N>" : "\<Tab>"
" From coc.nvim github
" inoremap <silent><expr> <TAB>
"             \ pumvisible() ? "\<C-n>" :
"             \ <SID>check_back_space() ? "\<TAB>" :
"             \ coc#refresh()

let mapleader = ","
noremap <C-A-l> :Autoformat<CR>
nnoremap <F1> <C-w>w


"===========================================================
"--------------------------Plugins--------------------------
"===========================================================
call plug#begin('~/.config/nvim/plugged')
" plugins will go here

" Theme
Plug 'marko-cerovac/material.nvim'

" Telescope requires plenary to function
Plug 'nvim-lua/plenary.nvim'
" The main Telescope plugin
Plug 'nvim-telescope/telescope.nvim'
" An optional plugin recommended by Telescope docs
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make' }

" Airline statusbar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'mhinz/vim-signify'

" vim-fugitive
Plug 'tpope/vim-fugitive'

" COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Nerd tree
Plug 'preservim/nerdtree'

" Better scrolling
Plug 'psliwka/vim-smoothie'

" RainbowBrackets
Plug 'luochen1990/rainbow'
" Plug 'frazrepo/vim-rainbow'

" Terminal in vim
Plug 'voldikss/vim-floaterm'

" ALE
Plug 'dense-analysis/ale'

" Auto pairs
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

" Formatting
" Plug 'Chiel92/vim-autoformat'

" Treeshitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

" Commenting (gcc)
Plug 'tpope/vim-commentary'

" Git stuff
Plug 'airblade/vim-gitgutter'

" Wakatime
Plug 'wakatime/vim-wakatime'

" Debugger
Plug 'puremourning/vimspector'

" Tree icons
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

" Tab management
" Plug 'vim-ctrlspace/vim-ctrlspace'

call plug#end()

"===========================================================
"--------------------------Colours--------------------------
"===========================================================
colorscheme material
let g:material_style = 'oceanic'
let g:rainbow_active = 1
let g:rainbow_conf = {'guifgs': ['Yellow', 'Magenta','LightBlue']}
" let g:rainbow_guifgs = ['Yellow', 'Magenta','LightBlue']
" let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']
" let g:rainbow_load_separately = [[ '*.*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ]]


"===========================================================
"-----------------------Plugin Setups-----------------------
"===========================================================
" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#tabline#enabled = 1
set updatetime=100
set noshowmode

" Lua script
lua require('lars-vc')

" NERD tree
autocmd VimEnter * NERDTree | wincmd p
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Floatterm
" Save all tabs when opening terminal
nnoremap   <silent>   <F12>   :wa<CR>:FloatermToggle<CR> 
tnoremap   <silent>   <F12>   <C-\><C-n>:FloatermToggle<CR>

" Gitgutter
" Disable the signs on boot
:au VimEnter * :GitGutterSignsDisable

" Coc.nvim
set cmdheight=2
set signcolumn=number
autocmd CursorHold * silent call CocActionAsync('highlight')
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Autoformatting with coc
let g:python3_host_prog="/usr/bin/python"
au BufWrite * :call CocAction('format')
noremap <F3> :call CocAction('format')<CR>

" Nerd tree icons
" let g:webdevicons_conceal_nerdtree_brackets = 0
" set guifont=Hack\ Regular\ Nerd\ Font\ 11
"autocmd FileType nerdtree setlocal nolist
set conceallevel=3

" Treesitter enable highlight
lua <<EOF
require'nvim-treesitter.configs'.setup {
    highlight = {
    enable = true,
    custom_captures = {
        -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
        ["foo.bar"] = "Identifier",
        },
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
    },
}
EOF

" CtrlSpace
" set nocompatible
" set hidden
" set showtabline=0
" let g:CtrlSpaceDefaultMappingKey = "<C-space> "
