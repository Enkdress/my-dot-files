-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`

local action_layout = require("telescope.actions.layout")
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
	extensions = {
		["tmux"] = {
			require("telescope.themes").get_dropdown(),
		},
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
			-- Configurar el estilo de los iconos
			icons = {
				["class"] = " ",
				["color"] = " ",
				["constant"] = " ",
				["constructor"] = " ",
				["enum"] = " ",
				["enum-member"] = " ",
				["event"] = " ",
				["field"] = "ﰠ ",
				["file"] = " ",
				["folder"] = " ",
				["function"] = " ",
				["interface"] = "ﰮ ",
				["keyword"] = " ",
				["method"] = "ƒ ",
				["module"] = " ",
				["operator"] = " ",
				["property"] = "ﰠ ",
				["reference"] = " ",
				["snippet"] = " ",
				["struct"] = "פּ ",
				["text"] = " ",
				["type-parameter"] = " ",
			},
		},
	},
})

function ModifiedGitFiles()
	local top_level = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
	if top_level == "" or not vim.fn.isdirectory(top_level .. "/.git") then
		print("Error: Not in a Git repository")
	else
		require("telescope.builtin").git_status({
			prompt_title = "Git Modified Files",
			cwd = top_level,
			show_untracked_files = false,
		})
	end
end

-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "tmux")
pcall(require("telescope").load_extension, "file_browser")
local fb_actions = require("telescope._extensions.file_browser.actions")

local function telescope_buffer_dir()
	return vim.fn.expand("%:p:h")
end

vim.keymap.set("n", "<leader>[gs", require("telescope.builtin").git_status, { desc = "[G]it Status" })
vim.keymap.set("n", "<leader>[gb", require("telescope.builtin").git_branches, { desc = "[G]it Branches" })
vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader>b", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader><leader>", ":lua ModifiedGitFiles()<CR>", { desc = "[S]earch [G]it [F]iles" })
vim.keymap.set("n", "sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })

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

vim.keymap.set("n", "sf", function()
	require("telescope.builtin").find_files(require("telescope.themes").get_ivy(my_ivy_options))
end, { desc = "[S]earch [F]iles" })

vim.keymap.set("n", "<leader>ts", function()
	require("telescope").extensions.tmux.sessions(
		require("telescope.themes").get_dropdown({ winblend = 15, previewer = false })
	)
end, { desc = "[T]mux [S]essions" })

vim.keymap.set("n", "<leader>/", function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 15,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })

vim.keymap.set("n", "sfe", function()
	require("telescope").extensions.file_browser.file_browser({
		path = "%:p:h",
		hijack_netrw = true,
		cwd = telescope_buffer_dir(),
		respect_gitignore = true,
		hidden = true,
		grouped = true,
		previewer = true,
		mappings = {
			["i"] = {
				["<A-c>"] = fb_actions.create,
				["<S-CR>"] = fb_actions.create_from_prompt,
				["<A-r>"] = fb_actions.rename,
				["<A-m>"] = fb_actions.move,
				["<A-y>"] = fb_actions.copy,
				["<A-d>"] = fb_actions.remove,
				["<C-o>"] = fb_actions.open,
				["<C-g>"] = fb_actions.goto_parent_dir,
				["<C-e>"] = fb_actions.goto_home_dir,
				["<C-w>"] = fb_actions.goto_cwd,
				["<C-t>"] = fb_actions.change_cwd,
				["<C-f>"] = fb_actions.toggle_browser,
				["<C-h>"] = fb_actions.toggle_hidden,
				["<C-s>"] = fb_actions.toggle_all,
				["<bs>"] = fb_actions.backspace,
			},
			["n"] = {
				["c"] = fb_actions.create,
				["r"] = fb_actions.rename,
				["m"] = fb_actions.move,
				["y"] = fb_actions.copy,
				["d"] = fb_actions.remove,
				["o"] = fb_actions.open,
				["g"] = fb_actions.goto_parent_dir,
				["e"] = fb_actions.goto_home_dir,
				["w"] = fb_actions.goto_cwd,
				["t"] = fb_actions.change_cwd,
				["f"] = fb_actions.toggle_browser,
				["h"] = fb_actions.toggle_hidden,
				["s"] = fb_actions.toggle_all,
			},
		},
	})
end, { desc = "[S]earch [F]ile [E]xplorer" })
