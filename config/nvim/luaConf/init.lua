vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.filetype.add({ extension = { templ = "templ" } })

require("enkdress.base")
require("enkdress.plugins")
require("enkdress.maps")
require("enkdress.icons")
require("enkdress.breadcrumbs")

