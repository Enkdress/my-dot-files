return {
	-- Enable rainbow parenthesis
	{ "HiPhish/rainbow-delimiters.nvim" },
	{ "tpope/vim-fireplace" },
	{ "guns/vim-sexp" },
	{ "tpope/vim-sexp-mappings-for-regular-people" },
	{ "liquidz/vim-iced" },

	-- Add s-exp mappings
	{ "PaterJason/nvim-treesitter-sexp" },
	{
		"m00qek/baleia.nvim",
		config = function()
			vim.g.conjure_baleia = require("baleia").setup({ line_starts_at = 3 })

			vim.api.nvim_create_user_command("BaleiaColorize", function()
				vim.g.conjure_baleia.once(vim.api.nvim_get_current_buf())
			end, { bang = true })

			vim.api.nvim_create_user_command("BaleiaLogs", vim.g.conjure_baleia.logger.show, { bang = true })
		end,
	},
	-- Use Clojure REPL
	{
		"Olical/conjure",
		config = function(_, _)
			require("conjure.main").main()
			require("conjure.mapping")["on-filetype"]()
		end,
		init = function()
			-- disable diagnostics in log buffer and colorize it
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
			vim.g["conjure#filetypes"] = { "clojure" }
			vim.g["conjure#mapping#enable_ft_mappings"] = true

			vim.g["iced_enable_default_key_mappings"] = false
		end,
	},
}
