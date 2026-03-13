return {
	"Enkdress/tmux_extension",
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {
			search = {
				mode = "search",
			},
			highlight = {
				backdrop = true,
				matches = true,
				priority = 5000,
			},
			prompt = {
				enabled = true,
			},
		},
		keys = {
			{
				"<leader>fj",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash search",
			},
			{
				"<leader>fjt",
				mode = { "n", "o", "x" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash treesitter",
			},
			{
				"<leader>fjr",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote flash",
			},
		},
	},
}
