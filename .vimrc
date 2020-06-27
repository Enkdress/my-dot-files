let mapleader=" "

filetype on
filetype plugin on
filetype indent on

set termguicolors

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

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules

set showmatch
set ruler
set smartcase

set foldcolumn=2
set backspace=indent,eol,start

set splitbelow
set splitright

set signcolumn=yes

"highlight VertSplit ctermbg=NONE ctermfg=darkgray guibg=NONE
"highlight LineNr ctermfg=darkgrey
"highlight MatchParen cterm=none ctermbg=black ctermfg=red

set laststatus=2
set cursorline
set clipboard=unnamed

set showcmd
set encoding=utf-8

call plug#begin('~/.dotFiles/.vim/plugged')

" Themes
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'
Plug 'dracula/vim', { 'as': 'dracula' }

" IDE
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'kien/ctrlp.vim'
Plug 'neoclide/coc.nvim'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive'

" UI
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'mhinz/vim-startify'

" Languages
Plug 'yuezk/vim-js'
Plug 'pangloss/vim-javascript'
Plug 'HerringtonDarkholme/yats.vim'

Plug 'mxw/vim-jsx'

Plug 'ianks/vim-tsx'
Plug 'leafgarland/typescript-vim'

Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

call plug#end()

" Re scan all the document for better syntax highlighting
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

"colorscheme one
colorscheme gruvbox
set background=dark

" NERDTree configuration
let g:NERDTreeGitStatusWithFlags = 1

nmap <C-n> :NERDTreeToggle<CR>
vmap <C-c> <plug>NERDCommenterToggle
nmap <C-c> <plug>NERDCommenterToggle

let g:NERDTreeIgnore = ['^node_modules$']
let NERDTreeQuitOnOpen=1
let NERDTreeDirArrows=1
" let NERDTreeShowHidden=1
" let NERDTreeWinSize=30
" let NERDTreeHijackNetrw=0

" Airline configuration
let g:airline#extensions#tabline#enabled = 0
let g:airline_powerline_fonts=1
let g:airline_theme='one'

" Git gutter configuration
set updatetime=600
let g:gitgutter_enable=1
highlight GitGutterAdd ctermfg=Green
highlight GitGutterDelete ctermfg=Red
highlight GitGutterChange ctermfg=Yellow


" Ctrl P configuration
let g:ctrlp_working_path_mode = 'cr'
let g:ctrlp_custom_ignore = {
  \'dir': '\v[\/]\.(git|hg|svn|node_modules)$',
  \'file':'\v\.(exe|so|dll)$',
  \'link':'some_bad_symbolic_links',
  \}

" Coc Configuration
autocmd FileType json syntax match Comment +\/\/.\+$+
let g:jsx_ext_required = 0

source $HOME/.dotFiles/nvimConf/cocConfig.vim

let g:coc_global_extensions = [
  \ 'coc-git',
  \ 'coc-emmet',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-json',
  \ 'coc-css',
  \ 'coc-html',
  \ ]

" Remap for rename current word
nmap rr <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,javascript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Startify
let g:startify_bookmarks = [ {'w': '~/.vimrc'}, {'e': '~/.config/i3/config'} ]
let g:startify_update_oldfiles = 1
let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 0
let g:startify_fortune_use_unicode = 1
let g:startify_relative_path = 1
let g:startify_custom_header =
        \ startify#fortune#cowsay('', '═','║','╔','╗','╝','╚')

let g:startify_custom_footer =
       \ ['', "   Vim is awesome. You are going to damn good at it.", '']

function! s:list_commits_dotFiles()
  let git = 'git -C ~/.dotFiles'
  let commits = systemlist(git .' log --oneline | head -n5')
  let git = 'G'. git[1:]
  return map(commits, '{"line": matchstr(v:val, "\\s\\zs.*"), "cmd": "'. git .' show ". matchstr(v:val, "^\\x\\+") }')
endfunction

let g:startify_lists = [
      \ { 'header': ['   MRU'],            'type': 'files' },
      \ { 'header': ['   Sessions'],       'type': 'sessions' },
      \ { 'header': ['   Bookmarks'],       'type': 'bookmarks' },
      \ { 'header': ['   Commits Personal Files'],        'type': function('s:list_commits_dotFiles') },
      \ ]

" Personal shortcuts

" Normal mode
nnoremap <a-m> :Startify<CR>
nnoremap <c-s> :w<CR>
nnoremap <leader>q :q<CR>

nnoremap <leader>vp :vsplit<CR>

nnoremap <leader>' :noh<CR>

nnoremap <leader>tn :Te<CR>
nnoremap <leader>k :tabprev<CR>
nnoremap <leader>l :tabnext<CR>

" Movement remap
nnoremap a h
nnoremap s l
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-l> <C-w><C-l>

" In Insert mode
imap jj <Esc>

" Quick pairs
"imap ( ()<ESC>i
"imap [ []<ESC>i
"imap { {}<ESC>i

" File indentation
autocmd FileType html setlocal shiftwidth=4 tabstop=4
autocmd FileType js setlocal shiftwidth=2 tabstop=2
autocmd FileType jsx  setlocal shiftwidth=2 tabstop=2

" Open config file
nmap <leader>0 :tabedit ~/.dotFiles/.vimrc<CR>

" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
"autocmd BufEnter * call SyncTree()
