# Flash Keybindings

[flash.nvim](https://github.com/folke/flash.nvim) provides enhanced motion and jumping capabilities.

## Keybindings

| Key | Mode | Action |
|-----|------|--------|
| `<leader>fj` | n, x, o | Flash search - jump to any character |
| `<leader>fjt` | n, x, o | Flash treesitter - jump using treesitter nodes |
| `<leader>fjr` | o | Remote flash - search and edit multiple locations |

## Usage

### Flash Search

Press `<leader>fj` and type a character to jump to. Use `Enter` to confirm or `Esc` to cancel.

### Treesitter Jump

Press `<leader>fjt` to show treesitter nodes in the current buffer and jump to selected nodes.

### Remote Flash

In visual mode, press `<leader>fjr` to search and apply changes to multiple locations.
