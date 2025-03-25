return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		opt = { transparent = true },
		config = function()
			require("catppuccin").setup({
				transparent_background = true,
			})
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
	},
	{
		"olimorris/onedarkpro.nvim",
		config = function()
			require("onedarkpro").setup({
				styles = {
					types = "bold",
					methods = "NONE",
					numbers = "NONE",
					strings = "NONE",
					comments = "italic",
					keywords = "bold,italic",
					constants = "NONE",
					functions = "NONE",
					operators = "NONE",
					variables = "NONE",
					parameters = "italic",
					conditionals = "italic",
					virtual_text = "NONE",
				},
			})
		end,
	},
	"rebelot/kanagawa.nvim",
	"Shatur/neovim-ayu",
	"RRethy/base16-nvim",
	"folke/tokyonight.nvim",
	"ricardoraposo/gruvbox-minor.nvim",
}
