if vim.lsp.inlay_hint then
	vim.keymap.set(
		"n",
		"<leader>uh",
		function() vim.lsp.inlay_hint.enable(0, nil) end,
		{ desc = "Toggle Inlay Hint" }
	)
end
