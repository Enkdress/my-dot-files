# Neovim TypeScript/React Configuration

A Neovim configuration optimized for TypeScript, JavaScript, and React development.

## Requirements

- Neovim 0.10+
- [Lazy.nvim](https://github.com/folke/lazy.nvim) (included)
- [Nerd Font](https://www.nerdfonts.com/) (recommended)
- `make` command (for telescope-fzf-native)
- Node.js (for TypeScript LSP and formatters)

## Installation

```bash
# Option 1: Symlink to ~/.config/nvim
ln -s /path/to/this/repo ~/.config/nvim

# Option 2: Set NVIM_APPNAME
export NVIM_APPNAME=typescript
```

Then open Neovim - plugins will install automatically.

## Features

### Plugins Included

| Plugin | Purpose |
|--------|---------|
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder |
| [harpoon](https://github.com/ThePrimeagen/harpoon) | Quick file navigation |
| [oil.nvim](https://github.com/stevearc/oil.nvim) | File browser |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP client |
| [typescript-tools.nvim](https://github.com/pmizio/typescript-tools.nvim) | TypeScript enhancements |
| [blink.cmp](https://github.com/saghen/blink.cmp) | Autocompletion |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Formatting |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting |
| [flash.nvim](https://github.com/folke/flash.nvim) | Enhanced motion/jumping |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git integration |
| [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) | Color scheme |

### Language Support

- **TypeScript / JavaScript** - via ts_ls + typescript-tools
- **TSX / React** - via ts_ls + treesitter
- **JSON** - via jsonls
- **Astro** - via astro LSP
- **TailwindCSS** - via tailwindcss LSP

### Formatters

- **Prettier** - JS, TS, JSON, React
- **Stylua** - Lua

## Keybindings

See [docs/keybindings/](docs/keybindings/) for detailed keybinding documentation:

- [General](docs/keybindings/general.md)
- [Flash](docs/keybindings/flash.md)
- [Telescope](docs/keybindings/telescope.md)
- [Harpoon](docs/keybindings/harpoon.md)
- [Oil](docs/keybindings/oil.md)
- [LSP](docs/keybindings/lsp.md)

## Quick Start

| Key | Action |
|-----|--------|
| `<leader>sf` | Find files |
| `<leader>sg` | Search text |
| `<leader>fj` | Flash search |
| `<leader>a` | Add to harpoon |
| `<leader>al` | Show harpoon list |
| `<leader>op` | Open parent directory |
| `<leader>f` | Format buffer |
| `gd` | Go to definition |

## Configuration

### Adding New LSP Servers

Edit `init.lua` and add servers in the `servers` table:

```lua
local servers = {
  -- ts_ls = {},
  -- Add new servers here
}
```

### Adding Formatters

Edit the `formatters_by_ft` section in conform setup:

```lua
formatters_by_ft = {
  javascript = { "prettierd" },
}
```

## Troubleshooting

### Install Mason tools

```vim
:Mason
```

### Check LSP status

```vim
:LspInfo
```

### Reinstall plugins

```vim
:Lazy
```
Then press `U` to update all plugins.
