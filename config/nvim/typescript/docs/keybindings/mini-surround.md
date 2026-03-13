# Mini Surround

 textobject plugin for manipulating surrounding pairs.

## Features

Quickly add, delete, or replace surrounding characters like brackets, quotes, tags, and more.

## Keybindings

### Add Surroundings

| Keybinding | Action |
|------------|--------|
| `saiw)` | Add ( ) around inner word |
| `saiw"` | Add " " around inner word |
| `saiw'` | Add ' ' around inner word |
| `saiw[` | Add [ ] around inner word |
| `saiw{` | Add { } around inner word |
| `saiw<` | Add < > around inner word |
| `saiW)` | Add ( ) around inner WORD |
| `saipt` | Add `<tag></tag>` around paragraph |

### Delete Surroundings

| Keybinding | Action |
|------------|--------|
| `sd'` | Delete ' ' surroundings |
| `sd"` | Delete " " surroundings |
| `sd)` | Delete ( ) surroundings |
| `sd]` | Delete [ ] surroundings |
| `sd}` | Delete { } surroundings |

### Replace Surroundings

| Keybinding | Action |
|------------|--------|
| `sr'` | Replace ' with something else |
| `sr"` | Replace " with something else |
| `sr)` | Replace ( with something else |
| `sr]` | Replace [ with something else |

### Find Surroundings

| Keybinding | Action |
|------------|--------|
| `sf(` | Find next ( |
| `sF(` | Find previous ( |

## Examples

- `saiw(` - Add parentheses around word: `foo` → `(foo)`
- `saiw<q>` - Add quotes around word: `foo` → `"foo"`
- `sd"` - Delete quotes: `"foo"` → `foo`
- `sr'"` - Replace quotes: `"foo"` → `'foo'`

## Visual Mode

In visual mode, press `S` to surround the selection with the next character you type.

Example: Select text in visual mode, then press `S` then `(` → `(selection)`
