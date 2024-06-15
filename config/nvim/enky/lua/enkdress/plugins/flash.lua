return {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {},
	keys = {
		{
			"<leader>ss",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump({
					search = {
						mode = "search",
					},
				})
			end,
			desc = "Flash",
		},
		{
			"<leader>sS",
			mode = { "n", "o", "x" },
			function()
				require("flash").treesitter()
			end,
			desc = "Flash Treesitter ",
		},
		{
			"<leader>sr",
			mode = "o",
			function()
				require("flash").remote()
			end,
			desc = "Remote Flash",
		},
	},
}
