-- Tests keymaps
vim.keymap.set("n", "<leader>cta", ":IcedTestRerunLast<CR>", { silent = false })
vim.keymap.set("n", "<leader>ctu", ":IcedTestUnderCursor<CR>", { silent = false })
vim.keymap.set("n", "<leader>ctn", ":IcedTestNs<CR>", { silent = false })
vim.keymap.set("n", "<leader>ctr", ":IcedTestRedo<CR>", { silent = false })
vim.keymap.set("n", "<leader>ctp", ":IcedTestAll<CR>", { silent = false })

-- General keymaps
vim.keymap.set("n", "<leader>cgc", ":IcedConnect<CR>", { silent = false })

vim.keymap.set("n", "<leader>cgr", ":IcedRefresh<CR>", { silent = false })
vim.keymap.set("n", "<leader>cgR", ":IcedRefreshAll<CR>", { silent = false })

vim.keymap.set("n", "<leader>cge", "<Plug>(iced_eval)<Plug>(sexp_outer_list)<CR>", { silent = false })
vim.keymap.set("v", "<leader>cgE", ":IcedEvalVisual<CR>", { silent = false })
vim.keymap.set("n", "<leader>cgn", ":IcedEvalNs<CR>", { silent = false })

vim.keymap.set("n", "<leader>cgx", ":IcedClearNsCache<CR>", { silent = false })
vim.keymap.set("n", "<leader>cgp", ":IcedCommandPalette<CR>", { silent = false })
vim.keymap.set("n", "<leader>cgd", ":IcedFormDocument<CR>", { silent = false })

vim.g["iced#nrepl#buffer_size"] = 1048576
vim.g["iced_enable_clj_kondo_analysis"] = false
vim.g["iced#nrepl#ns#does_load_for_new_ns"] = false
-- vim.g["iced_enable_auto_document"] = "every"
vim.g["iced_enable_popup_document"] = "every"

