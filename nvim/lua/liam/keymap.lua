vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Keybind to exit to Netrw
vim.keymap.set({ 'n', 'v' }, '<leader>qq', vim.cmd.Ex)

-- Auto center screen when paging up/down
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- [[ Git keymaps ]]
vim.keymap.set('n', '<leader>gp', ':Git push -u origin HEAD<CR>', { desc = '[G]it [P]ush to HEAD' })
vim.keymap.set('n', '<leader>gc', ':Git commit<CR>', { desc = '[G]it [C]ommit' })