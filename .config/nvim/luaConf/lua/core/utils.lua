local map = function(mode, keybind, action, opts)
  vim.api.nvim_set_keymap(mode, keybind, action, opts)
end

return { mapper = map }
