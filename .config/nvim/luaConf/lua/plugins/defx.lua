-- if not vim.g.'loaded_defx' then return; end
local mapper = require('core.utils').mapper

-- Mappings
mapper('n', 'sf', ":<C-u>Defx -listed -resume -ignored_files=none -columns=indent:mark:icon:icons:filename:git:size -buffer-name=tab`tabpagenr()` `expand('%:p:h')` -search=`expand('%:p')`<CR>", { silent = true })
                    

