filetype on
filetype plugin on
filetype indent on

set expandtab
set rnu
set incsearch

set showtabline=0

set number
set relativenumber
set numberwidth=4

syntax enable
   
set smarttab
set shiftwidth=2
set tabstop=2
set softtabstop=2

set lbr
set tw=500

set ai
set si
set wrap

set showmatch
set ruler
set smartcase

set foldcolumn=2
set backspace=indent,eol,start

set splitbelow
set splitright

set signcolumn=yes

highlight VertSplit ctermbg=NONE ctermfg=darkgray guibg=NONE
highlight LineNr ctermfg=darkgrey

set laststatus=2
set cursorline
set clipboard=unnamed

set showcmd
set encoding=utf-8

highlight MatchParen cterm=none ctermbg=black ctermfg=red

call plug#begin('~/dot_files/.vim/plugged')

" Themes
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }

" IDE
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'valloric/youcompleteme'
Plug 'kien/ctrlp.vim'

" UI
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Languages
Plug 'airblade/vim-gitgutter'
Plug 'mxw/vim-jsx'

call plug#end()

colorscheme dracula
set background=dark
let g:dracula_bold=1
let g:dracula_underline=1

" NERDTree configuration
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeWinSize=10
let NERDTreeDirArrows=1
let NERDTreeHijackNetrw=0

" Airline configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter= 'unique_tail_improved'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts=1

" Git gutter configuration
set updatetime=100
let g:gitgutter_enable=1
highlight GitGutterAdd ctermfg=Green
highlight GitGutterDelete ctermfg=Red
highlight GitGutterChange ctermfg=Yellow


" Syntastic configuration

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_eslint_exe = 'eslint --'

set autoread

" LANGUAGES
""""""""""""""" JavaScript
let g:syntastic_javascript_checkers = ['eslint', 'JSXHint']

""""""""""""""" JSON
let g:syntastic_json_checkers=['jsonlint']

""""""""""""""" HTML
let g:syntastic_html_checkers=['ESlint']

""""""""""""""" CSS
let g:syntastic_css_checkers=['CSSLint', 'PrettyCSS']

""""""""""""""" TypeScript
let g:syntastic_typescript_checkers=['ESLint', 'TSLint']

"""""""""""""""""""""""""""""""""

let mapleader=" "

nnoremap <Leader>nt :NERDTreeFind<CR>

" Personal shortcuts

" Normal mode
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>vp :vsplit<CR>

" In Insert mode
imap jj <Esc>

" File indentation
autocmd FileType html setlocal shiftwidth=4 tabstop=4
autocmd FileType js setlocal shiftwidth=2 tabstop=2
autocmd FileType jsx  setlocal shiftwidth=2 tabstop=2

