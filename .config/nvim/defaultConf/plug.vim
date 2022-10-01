if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'olimorris/onedarkpro.nvim'
Plug 'navarasu/onedark.nvim'
Plug 'wojciechkepka/vim-github-dark'

if has("nvim")
  Plug 'catppuccin/nvim', {'as': 'catppuccin'}
  Plug 'hoob3rt/lualine.nvim'
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'williamboman/nvim-lsp-installer'
  Plug 'glepnir/lspsaga.nvim'
  Plug 'folke/lsp-colors.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'windwp/nvim-autopairs'
  Plug 'neovim/nvim-lspconfig'

  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'

  Plug 'kristijanhusak/defx-git'
  Plug 'kristijanhusak/defx-icons'

  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'hrsh7th/vim-vsnip-integ'

endif

call plug#end()
