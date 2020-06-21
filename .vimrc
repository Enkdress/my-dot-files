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

highlight VertSplit ctermbg=NONE ctermfg=darkgray guibg=NONE
highlight LineNr ctermfg=darkgrey
highlight MatchParen cterm=none ctermbg=black ctermfg=red

set laststatus=2
set cursorline
set clipboard=unnamed

set showcmd
set encoding=utf-8

call plug#begin('~/.dotFiles/.vim/plugged')

" Themes
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }

" IDE
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'   
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'kien/ctrlp.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neoclide/coc.nvim'

" UI
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Languages
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
Plug 'leafgarland/typescript-vim'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

call plug#end()

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

colorscheme gruvbox 
"colorscheme dracula 
set background=dark
let g:dracula_bold=1
let g:dracula_underline=1

" NERDTree configuration
let g:NERDTreeGitStatusWithFlags = 1

nmap <C-n> :NERDTreeToggle<CR>
vmap <C-c> <plug>NERDCommenterToggle
nmap <C-c> <plug>NERDCommenterToggle

let g:NERDTreeIgnore = ['^node_modules$']
" let NERDTreeQuitOnOpen=1
" let NERDTreeShowHidden=1
" let NERDTreeWinSize=30
" let NERDTreeDirArrows=1
" let NERDTreeHijackNetrw=0

" nnoremap <Leader>r :NERDTreeCWD<CR>

" Airline configuration
let g:airline#extensions#tabline#enabled = 0
" let g:airline#extensions#tabline#formatter= 'unique_tail'
" let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts=1

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
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-json', 
  \ ]

"let g:coc_explorer_global_presets = {
      "\   'floating': {
      "\      'position': 'floating',
      "\      'floating-width': 80,
      "\      'floating-position': 'center'
      "\   }
      "\ }
" nnoremap <silent><leader>ef :CocCommand explorer --preset floating <CR>
" nnoremap <silent><leader>e :CocCommand explorer<CR>

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Personal shortcuts

" Normal mode
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
autocmd BufEnter * call SyncTree()
