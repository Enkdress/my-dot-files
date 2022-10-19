-- map options = { <buffer>, <silent>, <nowait>, <script>, <expr>, <unique> }
local mapper = require('core.utils').mapper

local defaultMappingOptions = {
 silent = true
}


mapper('i', 'jk', '<ESC>', defaultMappingOptions)
mapper('n', 'sw', ':w<CR>', defaultMappingOptions)
