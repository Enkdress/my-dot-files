vim.opt.completeopt = { "menu", "menuone", "noselect", "preview" }
vim.opt.shortmess:append("c")

return {
	{
		"hrsh7th/nvim-cmp",
		lazy = false,
		priority = 100,
		dependencies = {
			"onsails/lspkind.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			{ "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
			"saadparwaiz1/cmp_luasnip",
			"PaterJason/cmp-conjure",
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
					{ name = "nvim_lsp" },
					{ name = "path" },
					{ name = "buffer" },
					{ name = "conjure" },
					{ name = "iced" },
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
				-- Enable luasnip to handle snippet expansion for nvim-cmp
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
			})

			local ls = require("luasnip")
			ls.config.set_config({
				history = false,
				updateevents = "TextChanged,TextChangedI",
			})

			vim.keymap.set({ "i", "s" }, "<c-k>", function()
				if ls.expand_or_jumpable() then
					ls.expand_or_jump()
				end
			end, { silent = true })

			vim.keymap.set({ "i", "s" }, "<c-j>", function()
				if ls.jumpable(-1) then
					ls.jump(-1)
				end
			end, { silent = true })
		end,
	},
}
