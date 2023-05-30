return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {
            defaults = {
                mappings = {
                    i = {
                        ['<C-u>'] = false,
                        ['<C-d>'] = false,
                    },
                },
            },
        },
        config = function()
            -- Enable telescope fzf native, if installed
            pcall(require('telescope').load_extension, 'fzf')

            -- See `:help telescope.builtin`
            local ts = require('telescope.builtin')
            vim.keymap.set('n', '<leader>?', ts.oldfiles, { desc = '[?] Find recently opened files' })
            vim.keymap.set('n', '<leader><space>', ts.buffers, { desc = '[ ] Find existing buffers' })

            vim.keymap.set('n', '<leader>sf', ts.find_files, { desc = '[S]earch [F]iles' })
            vim.keymap.set('n', '<leader>sh', ts.help_tags, { desc = '[S]earch [H]elp' })
            vim.keymap.set('n', '<leader>sw', ts.grep_string, { desc = '[S]earch current [W]ord' })
            vim.keymap.set('n', '<leader>sg', ts.live_grep, { desc = '[S]earch by [G]rep' })
            vim.keymap.set('n', '<leader>sd', ts.diagnostics, { desc = '[S]earch [D]iagnostics' })
            vim.keymap.set('n', '<leader>sd', ts.diagnostics, { desc = '[S]earch [D]iagnostics' })

            vim.keymap.set('n', '<leader>sc', ts.git_commits, { desc = '[S]earch Git [C]ommits' })
            vim.keymap.set('n', '<leader>sbc', ts.git_bcommits, { desc = '[S]earch [B]uffer Git [C]ommits' })
            vim.keymap.set('n', '<leader>ss', ts.git_status, { desc = '[S]earch Git [S]tatus' })
        end,
    },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
}
