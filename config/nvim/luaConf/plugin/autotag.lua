local status_autotag, autotag = pcall(require, "nvim-ts-autotag")
if (not status_autotag) then return end

autotag.setup({})
