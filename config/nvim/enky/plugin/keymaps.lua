vim.keymap.set("n", "\"f", ":Format<CR>", { silent = true, desc = "Format document" })
vim.keymap.set("n", "<leader>ls", ":so ~/.config/nvim/init.lua<CR>", { silent = true, desc = "Load configuration" })

-- Buffer movement
vim.keymap.set("n", "sh", "<C-w>h", { silent = true, desc = "Move to the left" })
vim.keymap.set("n", "sj", "<C-w>j", { silent = true, desc = "Move to the bottom" })
vim.keymap.set("n", "sk", "<C-w>k", { silent = true, desc = "Move to the top" })
vim.keymap.set("n", "sl", "<C-w>l", { silent = true, desc = "Move to the right" })

-- Split buffers
vim.keymap.set("n", "sv", ":vsplit<CR>", { silent = true, desc = "Vertical Split" })
vim.keymap.set("n", "ss", ":split<CR>", { silent = true, desc = "Horizontal Split" })

-- Save and Quit buffer
vim.keymap.set("n", "sw", ":w<CR>", { silent = true, desc = "Save file" })
vim.keymap.set("n", "sq", ":q<CR>", { silent = true, desc = "Quit buffer" })

-- Escape insert mode
vim.keymap.set("i", "jk", "<ESC><ESC>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Tabs
vim.keymap.set("n", "<leader>tt", ":tabnew<CR>", { silent = true, desc = "[T]ab New" })
vim.keymap.set("n", "<leader>tn", ":tabnext<CR>", { silent = true, desc = "[T]ab [N]ext" })
vim.keymap.set("n", "<leader>tp", ":tabprevious<CR>", { silent = true, desc = "[T]ab [P]revous" })
vim.keymap.set("n", "<leader>tq", ":bd<CR>", { silent = true, desc = "Quit buffer" })
vim.keymap.set("n", "<leader>t1", "1gt<CR>", { silent = true, desc = "Move to tab 1" })
vim.keymap.set("n", "<leader>t2", "2gt<CR>", { silent = true, desc = "Move to tab 2" })
vim.keymap.set("n", "<leader>t3", "3gt<CR>", { silent = true, desc = "Move to tab 3" })
vim.keymap.set("n", "<leader>t4", "4gt<CR>", { silent = true, desc = "Move to tab 4" })
vim.keymap.set("n", "<leader>t5", "5gt<CR>", { silent = true, desc = "Move to tab 5" })
vim.keymap.set("n", "<leader>t6", "6gt<CR>", { silent = true, desc = "Move to tab 6" })
vim.keymap.set("n", "<leader>t7", "7gt<CR>", { silent = true, desc = "Move to tab 7" })
vim.keymap.set("n", "<leader>t8", "8gt<CR>", { silent = true, desc = "Move to tab 8" })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- ZenMode
vim.keymap.set("n", "<leader>zm", ":ZenMode<CR>", { desc = "Open Zen Mode" })
