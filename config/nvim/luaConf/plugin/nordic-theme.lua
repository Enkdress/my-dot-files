local nordic = require('nordic')
local M = require 'enkdress.utils'

nordic.setup {
	override = {
		Normal = {
			bg = M.palette.black,
		},
		NormalNC = {
			bg = M.palette.black,
		},
		NormalFloat = {
			bg = M.palette.gray3
		},
		Visual = {
			bg = M.palette.gray3
		},
		TelescopeResultsBorder = { fg = M.palette.orange.base },
		TelescopePromptBorder = { fg = M.palette.orange.base },
		TelescopePreviewBorder = { fg = M.palette.blue0 },
	},
	noice = {
		style = "flat",
	},
	telescope = {
		style = "flat",
	},
}

vim.cmd [[
        silent! colorscheme nordic
]]
vim.cmd [[
  hi! link @text.uri Constant
  hi! link @text.emphasis Macro
  hi! link @operator NonText
]]
