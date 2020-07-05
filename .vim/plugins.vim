call plug#begin('~/.dotFiles/.vim/plugged')

" Themes
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'
Plug 'dracula/vim', { 'as': 'dracula' }

" IDE
Plug 'ctrlpvim/ctrlp.vim'

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'ryanoasis/vim-devicons'

Plug 'tpope/vim-fugitive'

Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" UI
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'mhinz/vim-startify'

" Languages
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'

Plug 'sheerun/vim-polyglot'
Plug 'yuezk/vim-js'
Plug 'pangloss/vim-javascript'
Plug 'HerringtonDarkholme/yats.vim'

Plug 'maxmellon/vim-jsx-pretty'
Plug 'flowtype/vim-flow'

Plug 'ianks/vim-tsx'
Plug 'leafgarland/typescript-vim'

Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

call plug#end()
