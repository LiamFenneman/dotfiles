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

local crates = require('crates')
crates.setup()
local function map(mode, l, r, desc)
    desc = '[C]rates: ' .. desc
    local opts = {
        noremap = true,
        silent = true,
        desc = desc,
    }
    vim.keymap.set(mode, l, r, opts)
end

map('n', '<leader>ct', crates.toggle, '[T]oggle hints')
map('n', '<leader>cr', crates.reload, '[R]eload')

map('n', '<leader>cv', crates.show_versions_popup, '[V]ersion popup')
map('n', '<leader>cf', crates.show_features_popup, '[F]eatures popup')
map('n', '<leader>cd', crates.show_dependencies_popup, '[D]epenencies popup')

map('n', '<leader>cH', crates.open_homepage, 'Open [H]omepage')
map('n', '<leader>cR', crates.open_repository, 'Open [R]epository')
map('n', '<leader>cD', crates.open_documentation, 'Open [D]ocumentation')
map('n', '<leader>cC', crates.open_crates_io, 'Open [C]rates.io')
