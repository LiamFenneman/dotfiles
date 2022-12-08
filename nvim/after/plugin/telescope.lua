local nnoremap = require("liam.keymap").nnoremap
local builtin = require("telescope.builtin")

nnoremap("<leader>ff", builtin.find_files)
nnoremap("<leader>fg", builtin.live_grep)
nnoremap("<leader>fb", builtin.buffers)
