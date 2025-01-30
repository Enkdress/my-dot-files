return {
	"ThePrimeagen/harpoon",
	config = function()
		local harpoon = require("harpoon")
		require("telescope").load_extension("harpoon")

		harpoon.setup({
			menu = {
				width = vim.api.nvim_win_get_width(0) - 50,
			},
			global_settings = {
				-- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
				save_on_toggle = false,

				-- saves the harpoon file upon every change. disabling is unrecommended.
				save_on_change = true,

				-- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
				enter_on_sendcmd = false,

				-- closes any tmux windows harpoon that harpoon creates when you close Neovim.
				tmux_autoclose_windows = false,

				-- filetypes that you want to prevent from adding to the harpoon list menu.
				excluded_filetypes = { "harpoon" },

				-- set marks specific to each git branch inside git repository
				mark_branch = false,

				-- enable tabline with harpoon marks
				tabline = false,
				tabline_prefix = "   ",
				tabline_suffix = "   ",
			},
		})

		vim.keymap.set(
			"n",
			"sa",
			':lua require("harpoon.mark").add_file()<CR>',
			{ silent = true, desc = "Harpoon Add File" }
		)
		vim.keymap.set(
			"n",
			"sm",
			':lua require("harpoon.ui").toggle_quick_menu()<CR>',
			{ silent = true, desc = "Harpoon Toggle Menu" }
		)
		vim.keymap.set(
			"n",
			"sp",
			':lua require("harpoon.ui").nav_prev()<CR>',
			{ silent = true, desc = "Harpoon Next File" }
		)
		vim.keymap.set(
			"n",
			"sn",
			':lua require("harpoon.ui").nav_next()<CR>',
			{ silent = true, desc = "Harpoon Prev File" }
		)

		-- Set <space>1..<space>5 be my shortcuts to moving to the files
		for _, idx in ipairs({ 1, 2, 3, 4, 5 }) do
			vim.keymap.set("n", string.format("<space>%d", idx), function()
				require("harpoon.ui").nav_file(idx)
			end)
		end
	end,
}
