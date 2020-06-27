let mapleader=" "

filetype on
filetype plugin on
filetype indent on

set termguicolors

set expandtab
set rnu

set showtabline=0

set smarttab
set shiftwidth=2
set tabstop=2
set softtabstop=2

set ruler

set splitbelow
set splitright

set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax enable
set showcmd
set ruler
set cursorline
set encoding=utf-8
set showmatch
set sw=2
set relativenumber

so ~/.dotFiles/.vim/plugins.vim
so ~/.dotFiles/.vim/plugins-conf.vim
so ~/.dotFiles/.vim/map.vim

"colorscheme one
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark = "hard"
let g:jsx_ext_required = 0
highlight Normal ctermbg=NONE

set laststatus=2
set noshowmode

" Javascript
" Re scan all the document for better syntax highlighting
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
autocmd BufRead *.js set filetype=javascript.jsx
autocmd BufRead *.jsx set filetype=javascript.jsx
augroup filetype javascript syntax=javascript


"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

