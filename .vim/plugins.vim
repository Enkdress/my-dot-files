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
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'

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
