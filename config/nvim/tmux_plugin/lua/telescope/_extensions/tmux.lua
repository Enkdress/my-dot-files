local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local sorters = require("telescope.sorters")
local previewers = require("telescope.previewers")
local telescope = require("telescope")
local tutils = require("telescope.utils")

local tmux_commands = {}
tmux_commands.list_sessions = function(opts)
	local cmd = { "tmux", "list-sessions" }
	if opts.format ~= nil then
		table.insert(cmd, "-F")
		table.insert(cmd, opts.format)
	end
	return tutils.get_os_command_output(cmd)
end
tmux_commands.session_id_fmt = "#{session_id}"
tmux_commands.session_name_fmt = "#S"

local function tmux_session_picker()
	local session_ids = tmux_commands.list_sessions({ format = tmux_commands.session_id_fmt })
	local user_formatted_session_names = tmux_commands.list_sessions({ format = tmux_commands.session_name_fmt })
	local formatted_to_real_session_map = {}
	for i, v in ipairs(user_formatted_session_names) do
		formatted_to_real_session_map[v] = session_ids[i]
	end
	local current_session =
		tutils.get_os_command_output({ "tmux", "display-message", "-p", tmux_commands.session_id_fmt })[1]

	pickers
		.new({}, {
			prompt_title = "Tmux Sessions",
			finder = finders.new_table({
				results = user_formatted_session_names,
				entry_maker = function(result)
					return {
						value = result,
						display = result,
						ordinal = result,
						valid = formatted_to_real_session_map[result] ~= current_session,
					}
				end,
			}),
			sorter = sorters.get_generic_fuzzy_sorter(),
			previewer = previewers.new_termopen_previewer({
				get_command = function(entry)
					local session_name = formatted_to_real_session_map[entry.value]
					return { "tmux", "attach-session", "-t", session_name, "-r" }
				end,
			}),
		})
		:find()
end

return telescope.register_extension({
	exports = {
		sessions = tmux_session_picker,
	},
})
