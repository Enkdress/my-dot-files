vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

-- Add lazy to the `runtimepath`, this allows us to `require` it.
---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Set up lazy, and load my `lua/custom/plugins/` folder
require("lazy").setup({ import = "enkdress/plugins" }, {
	change_detection = {
		notify = false,
	},
})

local function check_fav_schemas(color_name)
	local is_fav = false
	local fav_colorschemes = {
		"ayu",
		"rose-pine",
		"catppuccin",
		"tokyonight-night",
		"gruvbox-minor",
		"habamax",
		"minicyan",
		"base16-schemer-dark",
		"base16-atelier-savanna",
		"base16-atelier-lakeside",
		"base16-atelier-plateau",
		"base16-black-metal-bathory",
		"base16-ia-dark",
		"base16-kimber",
	}

	for _, color in pairs(fav_colorschemes) do
		if color == color_name then
			is_fav = true
		end
	end

	return is_fav
end

-- Get a list of built-in colorschemes
local function get_builtin_schemes()
	local schemes = {}
	for _, name in ipairs(vim.fn.getcompletion("", "color")) do
		if string.sub(name, 1, 1) ~= "_" then -- Ignore hidden schemes
			local is_fav = check_fav_schemas(name)
			if is_fav then
				table.insert(schemes, name)
			end
		end
	end

	return schemes
end

-- Pick a random scheme from the list
local function pick_random_scheme()
	local schemes = get_builtin_schemes()
	local random_index = math.random(#schemes)

	return schemes[random_index]
end

-- Set the colorscheme
vim.cmd.colorscheme(pick_random_scheme())

-- vim.cmd.colorscheme("rose-pine")
-- vim.cmd.colorscheme("kanagawa-dragon")
