vim.opt.completeopt = { "menu", "menuone", "noselect", "preview" }
vim.opt.shortmess:append("c")

return {
	{
		"hrsh7th/nvim-cmp",
		lazy = true,
		priority = 100,
		dependencies = {
			"onsails/lspkind.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"lamp/cmp-iced",
		},
		config = function()
			local lspkind = require("lspkind")

			local cmp = require("cmp")

			cmp.setup({
				formatting = {
					format = lspkind.cmp_format({
						menu = {
							buffer = "Buffer",
							path = "Path",
							nvim_lsp = "LSP",
							nvim_lua = "Lua",
						},
					}),
				},
				sources = {
					{ name = "iced" },
					{ name = "nvim_lsp" },
					{ name = "path" },
					{ name = "buffer" },
				},
				mapping = {
					["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-j>"] = cmp.mapping.complete({}),
					["<C-y>"] = cmp.mapping(
						cmp.mapping.confirm({
							behavior = cmp.ConfirmBehavior.Insert,
							select = true,
						}),
						{ "i", "c" }
					),
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
			})
		end,
	},
}
