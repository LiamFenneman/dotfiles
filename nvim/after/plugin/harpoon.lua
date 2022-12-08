local nnoremap = require("liam.keymap").nnoremap

local ui = require("harpoon.ui")
local mark = require("harpoon.mark")

nnoremap("<leader>ma", mark.add_file)
nnoremap("<leader>me", ui.toggle_quick_menu)
nnoremap("<leader>m1", function() ui.nav_file(1) end)
nnoremap("<leader>m2", function() ui.nav_file(2) end)
nnoremap("<leader>m3", function() ui.nav_file(3) end)
nnoremap("<leader>m4", function() ui.nav_file(4) end)
