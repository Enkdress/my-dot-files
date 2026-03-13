return {
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lspconfig", "stevearc/conform.nvim" },
		opts = {
			disable_server_capabilities = {
				definitionProvider = true,
			},
			settings = {
				tsserver_file_preferences = {
					includeInlayParameterNameHintsWhenArgumentMatchesName = false,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayVariableTypeHints = true,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayEnumMemberValueHints = true,
					-- organize imports
					organizeImportsSkipSync = false,
				},
			},
		},
	},
}
