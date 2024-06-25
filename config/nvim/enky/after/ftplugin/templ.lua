local lspconfig = require("lspconfig")
local capabilities = nil
if pcall(require, "cmp_nvim_lsp") then
	capabilities = require("cmp_nvim_lsp").default_capabilities()
end

local custom_format = function()
	if vim.bo.filetype == "templ" then
		local bufnr = vim.api.nvim_get_current_buf()
		local filename = vim.api.nvim_buf_get_name(bufnr)
		local cmd = "templ fmt " .. vim.fn.shellescape(filename)

		vim.fn.jobstart(cmd, {
			on_exit = function()
				-- Reload the buffer only if it's still the current buffer
				if vim.api.nvim_get_current_buf() == bufnr then
					vim.cmd("e!")
				end
			end,
		})
	else
		vim.lsp.buf.format()
	end
end

vim.filetype.add({
	extension = {
		templ = "templ",
	},
})

local on_attach_templ = function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }
	-- other configuration options
	vim.keymap.set("n", "<leader>f", custom_format, opts)
end

lspconfig.templ.setup({
	on_attach = on_attach_templ,
	capabilities = capabilities,
})

lspconfig.tailwindcss.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "templ", "astro", "javascript", "typescript", "react" },
	init_options = { userLanguages = { templ = "html" } },
})

lspconfig.html.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "html", "templ" },
})

lspconfig.htmx.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "html", "templ" },
})

require("nvim-treesitter.configs").setup({
	ensure_installed = { "templ" },
	sync_install = false,
	auto_install = true,
	ignore_install = { "javascript" },
	highlight = {
		enable = true,
	},
})
