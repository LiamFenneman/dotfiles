-- [[ GitHub Copilot ]]
require('copilot').setup({
    suggestion = { enabled = false },
    panel = { enabled = false },
})

-- [[ GitSigns ]]
require('gitsigns').setup {
    signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
    },
    current_line_blame = true,
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
        end, { expr = true, desc = 'Next hunk' })
        map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
        end, { expr = true, desc = 'Previous hunk' })

        -- Actions
        map({ 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<CR>', { desc = '[H]unk [S]tage' })
        map({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>', { desc = '[H]unk [R]eset' })
    end
}