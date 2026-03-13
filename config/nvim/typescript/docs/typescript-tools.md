# typescript-tools.nvim

Enhanced TypeScript/JavaScript integration for Neovim.

## What it does

- Better TypeScript LSP experience than standard `ts_ls`
- Provides TypeScript-specific code actions
- Improves completions and diagnostics
- Supports styled-components out of the box
- Manages separate TypeScript server for diagnostics

## Key Features

| Feature | Description |
|---------|-------------|
| Enhanced completions | Better function call completions |
| Organize imports | Sort and remove unused imports |
| Type hints | Inlay hints for parameters, variables, return types |
| Code actions | TypeScript-specific quick fixes |
| Diagnostics | Separate server for better diagnostic accuracy |

## Configuration

Currently configured with these preferences:

```lua
settings = {
  tsserver_file_preferences = {
    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
    includeInlayFunctionParameterTypeHints = true,
    includeInlayVariableTypeHints = true,
    includeInlayPropertyDeclarationTypeHints = true,
    includeInlayFunctionLikeReturnTypeHints = true,
    includeInlayEnumMemberValueHints = true,
    organizeImportsSkipSync = false,
  }
}
```

## Available Commands

| Command | Description |
|---------|-------------|
| `:TSToolsOrganizeImports` | Sort and remove unused imports |
| `:TSToolsSortImports` | Sort imports only |

## Usage with LSP

This plugin works alongside `nvim-lspconfig`. The LSP keybindings work as usual:

| Keybinding | Action |
|------------|--------|
| `gd` | Go to definition |
| `gr` | Find references |
| `<leader>ca` | Code actions |

## Requirements

- NeoVim >= 0.8.0
- TypeScript >= 4.0
- Node.js
