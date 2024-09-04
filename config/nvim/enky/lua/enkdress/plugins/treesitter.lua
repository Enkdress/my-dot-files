return {
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"vrischmann/tree-sitter-templ",
		},
		build = ":TSUpdate",
		branch = "main",
		lazy = false,
		config = function()
			local group = vim.api.nvim_create_augroup("custom-treesitter", { clear = true })

			require("nvim-treesitter").setup({
				ensure_install = { "community", "clojure" },
			})

			local syntax_on = {
				typescript = true,
				javascript = true,
				templ = true,
				python = true,
				lua = true,
				go = true,
				clojure = true,
			}

			vim.api.nvim_create_autocmd("FileType", {
				group = group,
				callback = function(args)
					local bufnr = args.buf
					local ft = vim.bo[bufnr].filetype
					pcall(vim.treesitter.start)

					if syntax_on[ft] then
						vim.bo[bufnr].syntax = "on"
					end
				end,
			})
		end,
	},
}
