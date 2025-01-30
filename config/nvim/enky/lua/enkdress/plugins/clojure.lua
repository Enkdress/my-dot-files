return {
	-- Enable rainbow parenthesis
	{ "HiPhish/rainbow-delimiters.nvim" },
	{ "tpope/vim-fireplace" },
	{ "guns/vim-sexp" },
	{ "tpope/vim-sexp-mappings-for-regular-people" },
	{ "liquidz/vim-iced" },
	-- { "bhurlow/vim-parinfer"},

	-- Add s-exp mappings
	{ "PaterJason/nvim-treesitter-sexp" },
	-- Use Clojure REPL
	{
		"Olical/conjure",
		config = function(_, _)
			require("conjure.main").main()
			require("conjure.mapping")["on-filetype"]()
		end,
		init = function()
			vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
				pattern = "conjure-log-*",
				callback = function()
					local buffer = vim.api.nvim_get_current_buf()
					vim.diagnostic.enable(true, { bufnr = buffer })
				end,
			})

			-- prefer LSP for jump-to-definition and symbol-doc, and use conjure
			-- alternatives with <localleader>K and <localleader>gd
			vim.g["conjure#mapping#doc_word"] = "K"
			vim.g["conjure#mapping#def_word"] = "gd"
			vim.g["conjure#log#hud#enabled"] = false
			vim.g["conjure#filetypes"] = { "clojure", "edn" }
			vim.g["conjure#mapping#enable_ft_mappings"] = true

			vim.g["iced_enable_default_key_mappings"] = false
		end,
	},
}
