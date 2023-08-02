-- First read our docs (completely) then check the example_config repo

local M = {}

M.ui = {
  theme = "gruvbox_material",
}

M.plugins = {
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },
  ["williamboman/mason.nvim"] = {
   override_options = {
      ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",

        -- web dev
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "deno",
        "emmet-ls",
        "json-lsp",
        "prisma-language-server",
        "tailwindcss-language-server",

        -- shell
        "shfmt",
        "shellcheck",
      },
    },
  },
   ["jose-elias-alvarez/null-ls.nvim"] = {
      after = "nvim-lspconfig",
      config = function()
         require "custom.plugins.null-ls"
      end,
  },
   ["easymotion/vim-easymotion"] = {}
}

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
