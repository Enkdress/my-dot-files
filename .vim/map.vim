" Normal mode
nnoremap <a-m> :Startify<CR>
nnoremap <c-s> :w<CR>
nnoremap <leader>q :q<CR>

nnoremap <leader>vp :vsplit<CR>

nnoremap <leader>' :noh<CR>

" Movement remap
nnoremap a h
nnoremap s l
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-l> <C-w><C-l>

" In Insert mode
imap jj <Esc>

" File indentation
autocmd FileType html setlocal shiftwidth=4 tabstop=4
autocmd FileType js setlocal shiftwidth=2 tabstop=2
autocmd FileType jsx  setlocal shiftwidth=2 tabstop=2

" Open config file
nmap <leader>0 :tabedit ~/.dotFiles/.vimrc<CR>

nnoremap <C-t> :split<CR>:terminal<CR>:res -10<CR>
nnoremap <c-b> :Rg<CR>

nnoremap <a-'> :source ~/.dotFiles/.vimrc<CR>

tnoremap <ESC> <C-\><C-n>
tnoremap <leader>q :q<CR>
