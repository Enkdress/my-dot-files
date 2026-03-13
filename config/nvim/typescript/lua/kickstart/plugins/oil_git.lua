return {
	{
		"malewicz1337/oil-git.nvim",
		dependencies = { "stevearc/oil.nvim" },
		opts = {
			show_file_highlights = true,
			show_directory_highlights = true,
			show_file_symbols = true,
			show_directory_symbols = true,
			symbol_position = "eol",
			symbols = {
				file = {
					added = "✚",
					modified = "✎",
					renamed = "→",
					deleted = "✖",
					copied = "󰆧",
					conflict = "⚡",
					untracked = "○",
					ignored = "",
				},
				directory = {
					added = "✚",
					modified = "✎",
					renamed = "→",
					deleted = "✖",
					copied = "󰆧",
					conflict = "⚡",
					untracked = "○",
					ignored = "",
				},
			},
		},
	},
}
