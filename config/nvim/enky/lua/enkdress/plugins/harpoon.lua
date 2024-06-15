-- return {
-- 	"ThePrimeagen/harpoon",
-- 	config = function()
-- 		local harpoon = require("harpoon")
-- 		harpoon:setup()
--
-- 		vim.keymap.set("n", "sa", function()
-- 			harpoon:list():add()
-- 		end)
-- 		vim.keymap.set("n", "sm", function()
-- 			harpoon.ui:toggle_quick_menu(harpoon:list())
-- 		end)
-- 		vim.keymap.set("n", "sn", function()
-- 			harpoon.list():nav_prev()
-- 		end)
-- 		vim.keymap.set("n", "sp", function()
-- 			harpoon.list():nav_next()
-- 		end)
--
-- 		-- Set <space>1..<space>5 be my shortcuts to moving to the files
-- 		for _, idx in ipairs({ 1, 2, 3, 4, 5 }) do
-- 			vim.keymap.set("n", string.format("<space>%d", idx), function()
-- 				harpoon:list():select(idx)
-- 			end)
-- 		end
-- 	end,
-- }
return {
	"ThePrimeagen/harpoon",
	config = function()
		pcall(require("telescope").load_extension("harpoon"))
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
	end,
}
