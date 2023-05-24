vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Keybind to exit to Netrw
vim.keymap.set({ 'n', 'v' }, '<leader>qq', vim.cmd.Ex)

-- Auto center screen when paging up/down
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Git keymaps
vim.keymap.set('n', '<leader>gp', ':Git push -u origin HEAD<CR>', { desc = '[G]it [P]ush to HEAD' })
vim.keymap.set('n', '<leader>gc', ':Git commit<CR>', { desc = '[G]it [C]ommit' })

-- Source current file
vim.keymap.set('n', '<leader><leader>x', ':source %<CR>', { desc = '[S]ource current file' })
vim.keymap.set('n', '<leader><leader>r', ':!cargo r<CR>', { desc = 'Cargo [R]un' })

vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { desc = '[F]ormat file' })
