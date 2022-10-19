return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'hoob3rt/lualine.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'windwp/nvim-autopairs'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'

  -- AutoCompletion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'

  -- Explorer
  use { 'Shougo/defx.nvim', run = ':UpdateRemotePlugins' }
  use { 'kristijanhusak/defx-git' }
  use { 'kristijanhusak/defx-icons' }
  
  -- Fuzzy
  use { 'nvim-telescope/telescope.nvim' }

  -- Theme
  use { 'gruvbox-community/gruvbox' }

  -- Highlighting
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Git
  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }


end)
