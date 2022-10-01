local M = {}

M.disabled = {
  n = {
    ["s"] = "",
    ["Q"] = ""
  }
}

M.general = {
  i = {
    ["jk"] = { "<ESC>", "Escape insert mode" , opts = { nowait = true }},
  },
  n = {
    ["sw"] = { ":w<CR>", "Save changes"},
    ["sq"] = { ":wq<CR>", "Quit saving changes"},
    ["sl"] = { "<C-w>l", "Move to the left buffer"},
    ["sh"] = { "<C-w>h", "Move to the right buffer"},
    ["sj"] = { "<C-w>j", "Move to the down buffer"},
    ["sk"] = { "<C-w>k", "Move to the up buffer"},
    [";sq"] = { ":q<CR>", "Close buffer", opts = { silent = true}},
    ["Q"] = { ":q!<CR>", "Close buffer without saving", opts = { silent = true}},
    [";sqa"] = { ":qa!<CR>", "Close all buffera without saving", opts = { silent = true}},
    [";sqwa"] = { ":wqa<CR>", "Close all buffera saving", opts = { silent = true}},

    -- Splits
    ["ss"] = { ":split<CR>", "Horizotal split"},
    ["sv"] = { ":vsplit<CR>", "Vertical split"},

  }
}

M.nvimtree = {
   n = {
      ["sf"] = { "<cmd> NvimTreeToggle <CR>", "   toggle nvimtree", opts = { nowait = true } },
  }
}

M.telescope = {
  n = {
    --- Fuzzy Finder
    [";f"] = { "<cmd> Telescope find_files<CR>", "Open Telescope", opts = { silent = true } },
    [";r"] = { "<cmd> Telescope live_grep<CR>", "Open Telescope", opts = { silent = true } },
    [";;"] = { "<cmd> Telescope keymaps<CR>", "Show Commands", opts = { silent = true } },

    --- Buffers
    [";b"] = { "<cmd> Telescope buffers<CR>", "Show buffers", opts = { silent = true } },

    --- Git
    [";gs"] = { "<cmd> Telescope git_status<CR>", "Open Telescope", opts = { silent = true } },
    [";gb"] = { "<cmd> Telescope git_branch<CR>", "Open Telescope", opts = { silent = true } },
  }
}

return M
