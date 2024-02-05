-- require('neorg').setup {
-- 	load = {
-- 		["core.defaults"] = {}, -- Loads default behaviour
-- 		["core.concealer"] = {}, -- Adds pretty icons to your documents
-- 		["core.integrations.telescope"] = {},
-- 		["core.dirman"] = {    -- Manages Neorg workspaces
-- 			config = {
-- 				workspaces = {
-- 					second_brain = "~/org/second_brain"
-- 				},
-- 			},
-- 		},
-- 	},
-- }
--
-- vim.keymap.set('n', '\\ww', ':Neorg workspace second_brain<CR>', { silent = true })
-- vim.keymap.set('n', '\\wq', ':Neorg return<CR>', { silent = true })
-- vim.keymap.set('n', '\\wi', ':Neorg index<CR>', { silent = true })
-- vim.keymap.set('n', '\\wj', ':Neorg journal<CR>', { silent = true })
--
-- local neorg_callbacks = require("neorg.core.callbacks")
--
-- neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
-- 	local leader = keybinds.leader
--
-- 	keybinds.map_event_to_mode("norg", {
-- 		n = { -- Bind keys in normal mode
-- 			{ "<C-s>", "core.integrations.telescope.find_linkable" },
-- 		},
--
-- 		i = { -- Bind in insert mode
-- 			{ "<C-l>", "core.integrations.telescope.insert_link" },
-- 		},
-- 	}, {
-- 		silent = true,
-- 		noremap = true,
-- 	})
-- end)
