if !exists('g:loaded_telescope') | finish | endif

nnoremap <silent> ;f <cmd>Telescope find_files theme=dropdown prompt_prefix=🔍 hidden=true<cr>
nnoremap <silent> ;r <cmd>Telescope live_grep theme=dropdown prompt_prefix=🔍<cr>
nnoremap <silent> \\ <cmd>Telescope buffers<cr>
nnoremap <silent> ;; <cmd>Telescope help_tags<cr>

lua << EOF
local actions = require('telescope.actions')
-- Global remapping
------------------------------
require('telescope').setup{
  defaults = {
    file_ignore_patterns = { "node_modules", ".next" },
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  }
}
EOF
