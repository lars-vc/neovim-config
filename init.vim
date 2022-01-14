" lars-vc's config file
"    ___  __  ________  ________   ___    ___    _   ________ 
"  ╱╱   ╲╱  ╲╱    __  ╲╱   ___  ╲ ╱   ╲  ╱   ╲  ╱_╱ ╱        ╲
" ╱╱        ╱    __╱  ╱      ╱  ╱ ╲    ╲╱    ╱___  ╱         ╱
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
set shiftwidth=4
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
set noea
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
" set clipboard+=unnamedplus


"===========================================================
"--------------------------Keymaps--------------------------
"===========================================================
inoremap jk <Esc>
" inoremap kj <Esc>
inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"
inoremap <expr> <Tab> pumvisible() ? "\<C-N>" : "\<Tab>"
let mapleader = ","
nnoremap <F1> <C-w>w
" inoremap <A-h> <C-o>h
" inoremap <A-j> <C-o>j
" inoremap <A-k> <C-o>k
" inoremap <A-l> <C-o>l
inoremap <A-h> <Left>
inoremap <A-j> <Down>
inoremap <A-k> <Up>
inoremap <A-l> <Right>
nnoremap <F2> gT
nnoremap <F3> gt
:command Cheat tabedit ~/.config/nvim/cheatsheet.vim

"===========================================================
"--------------------------Plugins--------------------------
"===========================================================
call plug#begin('~/.config/nvim/plugged')
" --Theme--
Plug 'marko-cerovac/material.nvim'
" --Telescope--
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make' }
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
" Plug 'jiangmiao/auto-pairs'
Plug 'cohama/lexima.vim'
" Plug 'tpope/vim-surround'
" --Treeshitter--
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
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
" Plug 'tami5/sqlite.lua'
" --Indentlines--
" Plug 'lukas-reineke/indent-blankline.nvim'
" --Sessions--
Plug 'jistr/vim-nerdtree-tabs'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
call plug#end()

"===========================================================
"--------------------------Colours--------------------------
"===========================================================

colorscheme material
let g:material_style = 'oceanic'

"===========================================================
"-----------------------Plugin Setups-----------------------
"===========================================================
" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline_theme='deus'
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#tabline#enabled = 1
set updatetime=100
set noshowmode

" Lua script
lua require('lars-vc')

" NERD tree
" this is for session making
" autocmd VimEnter * nested call RestoreSess()
" autocmd VimEnter * NERDTree | wincmd p
autocmd VimEnter * if argc() == 1 | execute 'NERDTree' | wincmd p | endif
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Floatterm
" Save all tabs when opening terminal
nnoremap   <silent>   <F12>   :wa<CR>:FloatermToggle<CR>
tnoremap   <silent>   <F12>   <C-\><C-n>:FloatermToggle<CR>
let g:floaterm_height=0.95
let g:floaterm_width=0.8

" Gitgutter
" Disable the signs on boot
:au VimEnter * :GitGutterSignsDisable

" Coc.nvim
set cmdheight=2
set signcolumn=yes
autocmd CursorHold * silent call CocActionAsync('highlight')
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Autoformatting with coc
let g:python3_host_prog="/usr/bin/python"
au BufWrite * :call CocAction('format')
noremap <C-A-l> :call CocAction('format')<CR>
" GoTo code navigation.
nmap <silent> <leader>cd <Plug>(coc-definition)
nmap <silent> <leader>cy <Plug>(coc-type-definition)
nmap <silent> <leader>ci <Plug>(coc-implementation)
nmap <silent> <leader>cr <Plug>(coc-references)
nnoremap <silent> <leader>ct :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Nerd tree icons
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
  
require('neoclip').setup({
    --enable_persistant_history = true,
})

-- require("indent_blankline").setup {
--     space_char_blankline = " ",
--     show_current_context = true,
--     show_current_context_start = true,
-- }
EOF

" Telescope
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fc <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fn <cmd>Telescope neoclip plus<cr><Esc>
lua <<EOF
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
        -- layout_strategy="center",
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
            ["<C-j>"] = "Down",
            ["<C-k>"] = "Up",
        }
    }
}
EOF
" Vimspector
"let g:vimspector_sidebar_width = 33
let g:vimspector_code_minwidth = 90
let g:vimspector_terminal_maxwidth = 75
let g:vimspector_terminal_minwidth = 20
" Debug window setup
nmap <leader>dd : call vimspector#Launch()<CR>:NERDTreeClose<CR>2<C-w>j:q<CR> 
":resize 15<CR>
nmap <leader>dx : call vimspector#Reset()<CR>
nnoremap <leader>dX :call vimspector#ClearBreakpoints()<CR>
nnoremap <S-k> :call vimspector#StepOut()<CR>
nnoremap <S-l> :call vimspector#StepInto()<CR>
nnoremap <S-j> :call vimspector#StepOver()<CR>
nnoremap <leader>d_ :call vimspector#Restart()<CR>
nnoremap <leader>dn :call vimspector#Continue()<CR>
nnoremap <leader>drc :call vimspector#RunToCursor()<CR>
nnoremap <leader>dh :call vimspector#ToggleBreakpoint()<CR>
nnoremap <leader>de :call vimspector#ToggleConditionalBreakpoint()<CR>
" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval

" fu! SaveSess()
"     execute 'mksession! ' . getcwd() . '/.session.vim'
" endfunction

" fu! RestoreSess()
" if filereadable(getcwd() . '/.session.vim')
"     execute 'so ' . getcwd() . '/.session.vim'
"     if bufexists(1)
"         for l in range(1, bufnr('$'))
"             if bufwinnr(l) == -1
"                 exec 'sbuffer ' . l
"             endif
"         endfor
"     endif
" endif
" endfunction

" autocmd VimLeave * NERDTreeTabsClose
" autocmd VimLeave * call SaveSess()

" Workspaces
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'
let g:session_default_overwrite = 1

" Closing stuff
nnoremap <leader>xt :wa<cr>:tabclose<cr>
nnoremap <leader>xx :wa<cr>:qa<cr>
nnoremap <leader>xq :qa!<cr>
