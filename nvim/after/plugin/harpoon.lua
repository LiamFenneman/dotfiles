require('harpoon').setup({
    menu = {
        width = 80,
    }
})
local ui = require('harpoon.ui')
local mark = require('harpoon.mark')
vim.keymap.set({ 'n', 'v' }, '<leader>a', mark.add_file, { desc = '[A]dd marker' })
vim.keymap.set({ 'n', 'v' }, '<leader>e', ui.toggle_quick_menu, { desc = '[E]dit marker menu' })
vim.keymap.set({ 'n', 'v' }, '<leader>1', function() ui.nav_file(1) end, { desc = 'Go to marker [1]' })
vim.keymap.set({ 'n', 'v' }, '<leader>2', function() ui.nav_file(2) end, { desc = 'Go to marker [2]' })
vim.keymap.set({ 'n', 'v' }, '<leader>3', function() ui.nav_file(3) end, { desc = 'Go to marker [3]' })
vim.keymap.set({ 'n', 'v' }, '<leader>4', function() ui.nav_file(4) end, { desc = 'Go to marker [4]' })
