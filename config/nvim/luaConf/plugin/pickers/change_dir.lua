local pickers = require("telescope.pickers")
local finders = require("telescope.finders")

vim.api.nvim_create_user_command("ChangeCurrentDir", function()
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")
	local conf = require("telescope.config").values

	pickers
		.new({}, {
			previewer = false,
			results_title = vim.loop.cwd(),
			preview_title = false,
			prompt = "❯ ",
			prompt_title = false,
			multi_icon = "󰉋 ",

			theme = "ivy",
			sorting_strategy = "ascending",
			layout_strategy = "bottom_pane",
			layout_config = {
				height = 15,
				prompt_position = "bottom",
			},
			border = true,
			borderchars = {
				prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
				results = { " " },
				preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
			},

			finder = finders.new_oneshot_job({ "exa", "--only-dirs", "-a", "-a", "--git-ignore", "--icons" }, {}),
			sorter = conf.generic_sorter({}),
			attach_mappings = function(prompt_bufnr)
				actions.select_default:replace(function()
					local selection = action_state.get_selected_entry()
					local icon_bits = 4
					local folder_name = string.sub(selection.value, icon_bits)
					actions.close(prompt_bufnr)
					vim.cmd(":cd " .. folder_name)
				end)
				return true
			end,
		})
		:find()
end, {})

-- vim.keymap.set(
-- 	"n",
-- 	"<leader>bd",
-- 	":cd " .. vim.loop.cwd(),
-- 	{ silent = false, desc = "Change Current Working Directory" }
-- )
vim.keymap.set(
	"n",
	"<leader>bd",
	":ChangeCurrentDir<CR>",
	{ silent = false, desc = "Change Current Working Directory" }
)
