vim.api.nvim_set_var('loaded_python3_provider', 1)
vim.api.nvim_set_var('python3_host_prog', '/usr/bin/python3')

require('core.options')
require('core.mappings')
require('plugins')
