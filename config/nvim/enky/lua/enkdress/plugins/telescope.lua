return {
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local action_layout = require("telescope.actions.layout")
			local my_ivy_options = {
				layout_config = {
					height = 15,
					prompt_position = "bottom",
				},
				previewer = false,
				results_title = false,
				preview_title = false,
				prompt = "❯ ",
				prompt_title = false,
			}

			require("telescope").setup({
				pickers = {
					find_files = {
						mappings = {
							n = {
								["bb"] = function(prompt_bufnr)
									local selection = require("telescope.actions.state").get_selected_entry()
									local dir = vim.fn.fnamemodify(selection.path, ":p:h")
									require("telescope.actions").close(prompt_bufnr)
									-- Depending on what you want put `cd`, `lcd`, `tcd`
									vim.cmd(string.format("silent cd %s", dir))
								end,
							},
						},
					},
				},
				extensions = {
					fzf = {},
					wrap_results = true,
					history = {
						limit = 100,
					},
				},
				defaults = {
					border = true,
					color_devicons = true,
					file_previewer = require("telescope.previewers").cat.new,
					layout_config = {
						preview_width = 0.5,
					},
					mappings = {
						i = {
							["qq"] = "close",
						},
						n = {
							["qq"] = "close",
							["pt"] = action_layout.toggle_preview,
						},
					},
				},
			})

			pcall(require("telescope").load_extension, "fzf")

			local builtin = require("telescope.builtin")

			vim.keymap.set("n", "sf", function()
				builtin.find_files(require("telescope.themes").get_ivy(my_ivy_options))
			end, { desc = "[S]earch [F]iles" })
			vim.keymap.set("n", "sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
			vim.keymap.set("n", "sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
			vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "[F]ind existing buffers" })
			vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
			vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
			vim.keymap.set("n", "<space>/", builtin.current_buffer_fuzzy_find)
			vim.keymap.set("n", "<space>en", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end)
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		cond = function()
			return vim.fn.executable("make") == 1
		end,
	},
}
