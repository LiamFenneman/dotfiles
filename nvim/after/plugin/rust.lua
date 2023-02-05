local extension_path = vim.env.HOME .. '/codelldb/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'
local rt = require('rust-tools')

rt.setup({
    server = {
        standalone = false,
        on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set('n', '<C-e>', rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set('n', '<leader>cc', rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
    },
    dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path),
    },
})
