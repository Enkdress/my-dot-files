-- Install package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("enkdress.gitsigns").setup()
		end,
		event = "BufEnter",
		cmd = "Gitsigns",
	},
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",

	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
	},

	"windwp/nvim-ts-autotag",
	"norcalli/nvim-colorizer.lua",
	{
		"nvim-tree/nvim-web-devicons",
		enabled = true,
		lazy = true,
	},
	"mg979/vim-visual-multi",

	-- Detect tabstop and shiftwidth automatically
	"tpope/vim-sleuth",

	{
		-- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"mhartington/formatter.nvim",

			-- Additional lua configuration, makes nvim stuff amazing!
			"folke/neodev.nvim",
		},
	},
	{
		-- Autocompletion
		"hrsh7th/nvim-cmp",
		dependencies = {
			-- Snippet Engine & its associated nvim-cmp source
			{
				"L3MON4D3/LuaSnip",
				version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
				build = "make install_jsregexp",
			},
			"saadparwaiz1/cmp_luasnip",

			-- Adds LSP completion capabilities
			"hrsh7th/cmp-nvim-lsp",

			-- Adds a number of user-friendly snippets
			"rafamadriz/friendly-snippets",
		},
	},

	-- Useful plugin to show you pending keybinds.
	{ "folke/which-key.nvim", opts = {} },
	{ "folke/zen-mode.nvim" },
	-- breadcrumbs
	{
		"SmiteshP/nvim-navic",
		config = function()
			require("enkdress.breadcrumbs").setup()
		end,
		event = "User FileOpened",
		enabled = true,
	},

	{ "rose-pine/neovim", name = "rose-pine" },
	{ "navarasu/onedark.nvim" },
	{ "catppuccin/nvim", as = "catppuccin" },
	{ "sainnhe/gruvbox-material", as = "gruvbox" },
	{ "arcticicestudio/nord-vim", as = "nord" },
	{
		"Enkdress/nordic.nvim",
		lazy = false,
		priority = 1000,
	},

	{ "nvim-lualine/lualine.nvim" },
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},

	-- "gc" to comment visual regions/lines
	{ "numToStr/Comment.nvim", opts = {} },

	-- Fuzzy Finder (files, lsp, etc)
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{ "nvim-telescope/telescope-file-browser.nvim" },
	{ "ThePrimeagen/harpoon", depedencies = { "nvim-lua/plenary.nvim" } },

	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		cond = function()
			return vim.fn.executable("make") == 1
		end,
	},

	{
		"f-person/git-blame.nvim",
		event = "VeryLazy",
	},

	{
		-- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		config = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"<leader>ss",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump({
						search = {
							mode = function(str)
								return "\\<" .. str
							end,
						},
					})
				end,
				desc = "Flash",
			},
			{
				"<leader>sS",
				mode = { "n", "o", "x" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter ",
			},
			{
				"<leader>sr",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
	},
}, {})
