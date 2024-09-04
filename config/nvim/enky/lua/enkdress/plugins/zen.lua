return {
	"folke/zen-mode.nvim",
	opts = {
		window = {
			width = 180, -- width of the Zen window
			height = 1, -- height of the Zen window
			options = {
				relativenumber = true, -- disable relative numbers
				cursorline = true, -- disable cursorline
			},
		},
		plugins = {
			options = {
				enabled = true,
				ruler = false, -- disables the ruler text in the cmd line area
				showcmd = true, -- disables the command in the last line of the screen
				laststatus = 0, -- turn off the statusline in zen mode
			},
			gitsigns = { enabled = true }, -- disables git signs
			tmux = { enabled = true }, -- disables the tmux statusline
		},
	},
}
