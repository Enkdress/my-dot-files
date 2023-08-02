vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.colorscheme = 'rose-pine'

require('enkdress.base')
require('enkdress.plugins')
require('enkdress.maps')

vim.cmd [[
        silent! colorscheme rose-pine
        " hi Normal guibg=NONE ctermbg=NONE
        " hi NormalNC guibg=NONE ctermbg=NONE
        " hi TreesitterContext guibg=NONE ctermbg=NONE
    ]]
