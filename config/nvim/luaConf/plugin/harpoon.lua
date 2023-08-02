-- Harpoon
pcall(require("telescope").load_extension('harpoon'))
vim.keymap.set('n', 'sa', ':lua require("harpoon.mark").add_file()<CR>', { silent = true, desc = 'Harpoon Add File' })
vim.keymap.set('n', 'sm', ':lua require("harpoon.ui").toggle_quick_menu()<CR>',
	{ silent = true, desc = 'Harpoon Toggle Menu' })
vim.keymap.set('n', 'sp', ':lua require("harpoon.ui").nav_prev()<CR>', { silent = true, desc = 'Harpoon Next File' })
vim.keymap.set('n', 'sn', ':lua require("harpoon.ui").nav_next()<CR>', { silent = true, desc = 'Harpoon Prev File' })
