# Oil Plugins

Three plugins work together to enhance the Oil file browser experience.

## oil.nvim

**Main file browser plugin**

- Opens directories as editable buffers
- Navigate like a normal file (j/k, Enter, - for parent)
- Shows hidden files by default
- Integrated with Neovim features (buffers, registers, etc.)

**Keybinding:** `<leader>op` - Open parent directory

---

## oil-git.nvim

**Git status integration**

Shows git status icons next to files in the Oil browser:

| Icon | Meaning |
|------|---------|
| ✚ | Added (staged new file) |
| ✎ | Modified (changed) |
| → | Renamed |
| ✖ | Deleted |
| ○ | Untracked (new file) |
| ⚡ | Conflict (merge conflict) |
| (empty) | Ignored |

Files and directories are also color-coded based on status.

---

## oil-lsp-diagnostics.nvim

**LSP diagnostics integration**

Shows diagnostic counts for files with errors/warnings:

| Icon | Meaning |
|------|---------|
| E | Error count |
| W | Warning count |
| I | Info count |
| H | Hint count |

Displays counts in the gutter next to affected files.
