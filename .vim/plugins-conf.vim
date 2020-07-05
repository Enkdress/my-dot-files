" Coc Config
so ~/.dotFiles/nvimConf/cocConfig.vim

" HTML, JSX
let g:closetag_filenames = '*.html,*.js,*.jsx,*.ts,*.tsx'

" =========================================
"
" NERDTree configuration
"
" =========================================
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeIgnore = ['^node_modules$']
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeDirArrows=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeShowLineNumbers=1
let g:javascript_plugin_flow = 1

nmap <C-n><C-n> :NERDTreeToggle<CR>
vmap <C-c> <plug>NERDCommenterToggle
nmap <C-c> <plug>NERDCommenterToggle

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

" =========================================
"
" Airline configuration
"
" =========================================
let g:airline#extensions#tabline#enabled = 0
let g:airline_powerline_fonts=1
let g:airline_theme='one'

" =========================================
"
" Git gutter configuration
"
" =========================================
set updatetime=600
let g:gitgutter_enable=1
highlight GitGutterAdd ctermfg=Green
highlight GitGutterDelete ctermfg=Red
highlight GitGutterChange ctermfg=Yellow

" =========================================
"
" Ctrl P configuration
"
" =========================================
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|node_modules)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }
" =========================================
"
" Startify
"
" =========================================
let g:startify_bookmarks = [ 
      \  '~/.dotFiles', 
      \ '~/Documentos/Coding/portfolioClient', 
      \ '~/.config/i3/config', 
      \  ]
let g:startify_update_oldfiles = 1
let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 0
let g:startify_fortune_use_unicode = 1
let g:startify_relative_path = 1
let g:startify_custom_header = [
      \'▓█████  ███▄    █  ██ ▄█▀▓█████▄  ██▀███  ▓█████   ██████   ██████ ',
      \'▓█   ▀  ██ ▀█   █  ██▄█▒ ▒██▀ ██▌▓██ ▒ ██▒▓█   ▀ ▒██    ▒ ▒██    ▒ ',
      \'▒███   ▓██  ▀█ ██▒▓███▄░ ░██   █▌▓██ ░▄█ ▒▒███   ░ ▓██▄   ░ ▓██▄   ',
      \'▒▓█  ▄ ▓██▒  ▐▌██▒▓██ █▄ ░▓█▄   ▌▒██▀▀█▄  ▒▓█  ▄   ▒   ██▒  ▒   ██▒',
      \'░▒████▒▒██░   ▓██░▒██▒ █▄░▒████▓ ░██▓ ▒██▒░▒████▒▒██████▒▒▒██████▒▒',
      \'░░ ▒░ ░░ ▒░   ▒ ▒ ▒ ▒▒ ▓▒ ▒▒▓  ▒ ░ ▒▓ ░▒▓░░░ ▒░ ░▒ ▒▓▒ ▒ ░▒ ▒▓▒ ▒ ░',
      \'░ ░  ░░ ░░   ░ ▒░░ ░▒ ▒░ ░ ▒  ▒   ░▒ ░ ▒░ ░ ░  ░░ ░▒  ░ ░░ ░▒  ░ ░',
      \'░      ░   ░ ░ ░ ░░ ░  ░ ░  ░   ░░   ░    ░   ░  ░  ░  ░  ░  ░  ',
      \'░  ░         ░ ░  ░      ░       ░        ░  ░      ░        ░  ',
      \'          You are going to be awesome in programming bro!!!',
      \  ]

let g:startify_custom_footer =
       \ ['', "   Vim is awesome. You are going to be damn good at it.", '']

function! s:list_commits()
  let git = 'git -C ~/.dotFiles'
  let commits = systemlist(git .' log --oneline | head -n5')
  let git = 'G'. git[1:]
  return map(commits, '{"line": matchstr(v:val, "\\s\\zs.*"), "cmd": "'. git .' show ". matchstr(v:val, "^\\x\\+") }')
endfunction

function! s:list_projects() abort
  return map(finddir('.git', $HOME . '/Documentos/**', -1),
        \ {_, dir -> {'line': fnamemodify(dir, ':h:s?.*/??'), 'path': fnamemodify(dir, ':h')}})
endfunction

let g:startify_lists = [
      \ { 'header': ['   Sessions'],         'type': 'sessions' },
      \ { 'header': ['   MRU'],              'type': 'files' },
      \ { 'header': ['   Bookmarks'],        'type': 'bookmarks', 'indices': map(range(1,100), { _ -> 'b' . string(v:val)}) },
      \ { 'header': ['   GitHub Projects'],  'type':  function('s:list_projects'), 'indices': map(range(1, 100), { _ -> 'p' . string(v:val)}) },
      \ { 'header': ['   Commits dotFiles'], 'type':  function('s:list_commits'), 'indices': map(range(1, 100), { _ -> 'c' . string(v:val)}) },
      \ ]

" =========================================
"
" Easymotion 
"
" =========================================
" Desable defautl mapping
let g:EasyMotion_do_mapping = 0 

" Better seatching highlight with easymotion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" s{char}{char} to move to {char}{char}
nmap h <Plug>(easymotion-overwin-f2)
nmap t <Plug>(easymotion-s2)

" Move to word
map  <silent><Leader>w <Plug>(easymotion-bd-w)
nmap <silent><Leader>w <Plug>(easymotion-overwin-w)

map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" =========================================
"
" FZF 
"
" =========================================

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '40%' }

if has('nvim') || has('gui_running')
  let $FZF_DEFAULT_OPTS .= ' --inline-info'
endif

" Terminal buffer options for fzf
"autocmd! FileType fzf
"autocmd  FileType fzf set noshowmode noruler nonu

if exists('$TMUX')
  let g:fzf_layout = { 'tmux': '-p90%,60%' }
endif

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let options = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  let options = fzf#vim#with_preview(options, 'right', 'ctrl-/')
  call fzf#vim#grep(initial_command, 1, options, a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   "rg --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1,
  \   fzf#vim#with_preview('right', 'ctrl-/'), <bang>0)

" =========================================
"
" Other Configuration
"
" =========================================
autocmd BufEnter *.js :silent let myIndex = SearchPatternInFile("@flow") | call SwitchFlowOrTsLsps(myIndex)
autocmd BufEnter *.jsx :silent let myIndex = SearchPatternInFile("@flow") | call SwitchFlowOrTsLsps(myIndex)

function! SwitchFlowOrTsLsps(flowIndex)
  silent let stats = CocAction("extensionStats")
  silent let tsserver = get(filter(copy(stats), function('FindTsServer')), 0)
  if(a:flowIndex == 0)
    if(tsserver.state == 'disabled')
      call CocActionAsync("toggleExtension", "coc-tsserver")
    endif
  else
    if(tsserver.state == 'activated')
      call CocActionAsync("toggleExtension", "coc-tsserver")
    endif
  endif
endfunction

function! FindTsServer(idx, value) 
  return a:value.id == 'coc-tsserver'
endfunction

function! SearchPatternInFile(pattern)
    " Save cursor position.
    let save_cursor = getcurpos()

    " Set cursor position to beginning of file.
    call cursor(0, 0)

    " Search for the string 'hello' with a flag c.  The c flag means that a
    " match at the cursor position will be accepted.
    let search_result = search(a:pattern, "c")

    " Set the cursor back at the saved position.  The setpos function was
    " used here because the return value of getcurpos can be used directly
    " with it, unlike the cursor function.
    call setpos('.', save_cursor)

    " If the search function didn't find the pattern, it will have
    " returned 0, thus it wasn't found.  Any other number means that an instance
    " has been found.
    return search_result
endfunction

