let mapleader=" "
filetype on
filetype plugin on
filetype indent on
syntax enable

set wildignore+=*/node_modules/*,_site,*/__pycache__/,*/venv/*,*/target/*,*/.vim$,\~$,*/.log,*/.aux,*/.cls,*/.aux,*/.bbl,*/.blg,*/.fls,*/.fdb*/,*/.toc,*/.out,*/.glo,*/.log,*/.ist,*/.fdb_latexmk,*/.next/*
set termguicolors
set autoindent
set smarttab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set relativenumber 
set number
set numberwidth=5
set noswapfile
set splitbelow
set splitright
set clipboard=unnamed
set showcmd
set ruler
set cursorline
set encoding=utf-8
set showmatch

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

autocmd BufRead *.js  set filetype=javascriptreact
autocmd BufRead *.jsx set filetype=javascript.jsx
autocmd BufRead *.ts  set filetype=tsx
autocmd BufRead *.tsx set filetype=tsx

augroup filetype javascript syntax=javascript

"" Searching
set nohlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

