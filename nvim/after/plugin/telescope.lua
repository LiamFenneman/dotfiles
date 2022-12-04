local nnoremap = require("liam.keymap").nnoremap
local builtin = require("telescope.builtin")

nnoremap("<leader>ff", function() builtin.find_files() end)
nnoremap("<leader>fg", function() builtin.live_grep() end)
nnoremap("<leader>fb", function() builtin.buffers() end)
