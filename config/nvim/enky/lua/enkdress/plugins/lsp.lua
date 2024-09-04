return {
	-- LSP Configuration & Plugins
	"neovim/nvim-lspconfig",
	dependencies = {
		-- Automatically install LSPs to stdpath for neovim
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",

		{ "j-hui/fidget.nvim", opts = {} },

		-- Autoformatting
		"stevearc/conform.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",

		-- Schema information
		"b0o/SchemaStore.nvim",
	},
	config = function()
		local capabilities = nil
		if pcall(require, "cmp_nvim_lsp") then
			capabilities = require("cmp_nvim_lsp").default_capabilities()
		end

		local lspconfig = require("lspconfig")

		local servers = {
			clojure_lsp = true,
			gopls = true,
			pyright = true,
			lua_ls = true,
			templ = true,
			html = true,
			htmx = true,
			cssls = true,
			eslint = true,
			vtsls = {
				settings = {
					javascript = {
						inlayHints = {
							includeInlayEnumMemberValueHints = true,
							includeInlayFunctionLikeReturnTypeHints = true,
							includeInlayFunctionParameterTypeHints = true,
							includeInlayParameterNameHints = "literals", -- 'none' | 'literals' | 'all';
							includeInlayParameterNameHintsWhenArgumentMatchesName = true,
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayVariableTypeHints = true,
						},
					},
					typescript = {
						inlayHints = {
							includeInlayFunctionParameterTypeHints = true,
							includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
							includeInlayParameterNameHintsWhenArgumentMatchesName = true,
							includeInlayPropertyDeclarationTypeHints = true,
						},
					},
				},
			},
			tailwindcss = {
				userLanguages = { templ = "html" },
			},
			jsonls = {
				settings = {
					json = {
						schemas = require("schemastore").json.schemas(),
						validate = { enable = true },
					},
				},
			},
			yamlls = {
				settings = {
					yaml = {
						schemaStore = {
							enable = false,
							url = "",
						},
						schemas = require("schemastore").yaml.schemas(),
					},
				},
			},
		}

		local servers_to_install = vim.tbl_filter(function(key)
			local t = servers[key]
			if type(t) == "table" then
				return not t.manual_install
			else
				return t
			end
		end, vim.tbl_keys(servers))

		require("mason").setup()

		local ensure_installed = {
			"stylua",
			"lua_ls",
			"typescript-language-server",
			"tailwindcss",
			"gopls",
			"jsonls",
			"clojure_lsp",
		}

		vim.list_extend(ensure_installed, servers_to_install)

		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		for name, config in pairs(servers) do
			if config == true then
				config = {}
			end
			config = vim.tbl_deep_extend("force", {}, {
				capabilities = capabilities,
			}, config)

			lspconfig[name].setup(config)
		end

		local disable_semantic_tokens = {
			lua = true,
		}

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local nmap = function(keys, func, desc)
					if desc then
						desc = "LSP: " .. desc
					end

					vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
				end

				local bufnr = args.buf
				local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")

				vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
				nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

				nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
				nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
				nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
				nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
				nmap("gT", vim.lsp.buf.type_definition, "[G]oto [T]ype Definition")
				nmap("K", vim.lsp.buf.hover, "Hover Documentation")
				nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

				nmap("<space>cr", vim.lsp.buf.rename)
				nmap("<space>ca", vim.lsp.buf.code_action)

				-- Hover and Signature Documentation UI
				vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
					border = "rounded",
				})

				vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
					border = "rounded",
				})

				vim.diagnostic.config({
					virtual_text = {
						severity = { min = vim.diagnostic.severity.WARN },
						prefix = "●",
					},
					updade_in_insert = false,
					underline = { severity = { max = vim.diagnostic.severity.INFO } },
					float = {
						source = "always", -- Or "if_many"
						border = "rounded",
					},
				})

				local filetype = vim.bo[bufnr].filetype
				if disable_semantic_tokens[filetype] then
					client.server_capabilities.semanticTokensProvider = nil
				end

				-- Autoformatting Setup
				require("conform").setup({
					formatters = {
						prettier = {
							require_cwd = true,
						},
					},
					formatters_by_ft = {
						lua = { "stylua" },
						javascript = { "prettier" },
						javascriptreact = { "prettier" },
						typescript = { "prettier" },
						typescriptreact = { "prettier" },
						go = { "gofmt" },
						graphql = { "prettier" },
						clojure = { "cljfmt" },
					},
					log_level = vim.log.levels.DEBUG,
				})

				vim.api.nvim_create_user_command("Format", function(args)
					local range = nil
					if args.count ~= -1 then
						local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
						range = {
							start = { args.line1, 0 },

							["end"] = { args.line2, end_line:len() },
						}
					end
					require("conform").format({ async = true, lsp_fallback = true, range = range })
				end, { range = true })
			end,
		})
	end,
}
