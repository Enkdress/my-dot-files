set number
set relativenumber
set numberwidth=4

syntax enable
   
set smarttab
set shiftwidth=2
set tabstop=2

set lbr
set tw=500

set ai
set si
set wrap

set showmatch
set ruler
set smartcase

set foldcolumn=2

set laststatus=2
set cursorline
set clipboard=unnamed

set showcmd
set encoding=utf-8

call plug#begin('~/dot_files/.vim/plugged')

" Themes
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }

" IDE
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'valloric/youcompleteme'

call plug#end()

colorscheme dracula
set background=dark
let g:dracula_bold=1
let g:dracula_underline=1

" NERDTree configuration
let NERDTreeQuitOnOpen=1

" Syntastic configuration
"et statusline+=%#warningmsg#
"et statusline+=%{SyntasticStatuslineFlag()}
"et statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


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
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>vp :vsplit<CR>
