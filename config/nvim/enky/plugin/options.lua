local opt = vim.opt

----- Interesting Options -----
opt.cursorline = true

-- You have to turn this one on :)
opt.inccommand = "split"

-- Best search settings :)
opt.smartcase = true

opt.ignorecase = true

----- Personal Preferences -----

opt.number = true
opt.relativenumber = true

opt.splitbelow = true
opt.splitright = true

opt.signcolumn = "yes"
opt.shada = { "'10", "<0", "s10", "h" }

opt.clipboard = "unnamedplus"

-- Don't have `o` add a comment
opt.formatoptions:remove("o")

opt.wildignore:append({ "*/node_modules/*", "*/.next/*" })

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
