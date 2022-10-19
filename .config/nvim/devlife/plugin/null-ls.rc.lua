local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })

local builtins = null_ls.builtins
local c = builtins.completion
local ca = builtins.code_actions
local d = builtins.diagnostics
local f = builtins.formatting

local sources = {
  ca.eslint,
  ca.refactoring,
  d.tsc,
  f.prettier,
}

null_ls.setup {
  sources = sources,
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_clear_autocmds { buffer = 0, group = augroup_format }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup_format,
        buffer = 0,
        callback = function() vim.lsp.buf.formatting_seq_sync() end
      })
    end
  end,
}
