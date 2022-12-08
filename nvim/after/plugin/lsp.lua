local nnoremap = require("liam.keymap").nnoremap;
nnoremap("<leader>rf", "<cmd>LspZeroFormat<CR>")

local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    "tsserver",
    "eslint",
    "sumneko_lua",
    "rust_analyzer",
})

local cmp = require("cmp")
local cmp_select = {behavior = cmp.SelectBehavior.Select}
lsp.setup_nvim_cmp({
    mapping = lsp.defaults.cmp_mappings({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm(cmp_select),
        ['<C-Space>'] = cmp.mapping.complete(),
    })
})

lsp.set_preferences({
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function (client, bufnr)
    local opts = {buffer = bufnr, remap = false}
    local bind = vim.keymap.set

    bind("n", "R", vim.lsp.buf.rename, opts)
    bind("n", "ca", vim.lsp.buf.code_action, opts)
    bind("n", "<leader>vd", vim.diagnostic.open_float, opts)
    bind("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

lsp.nvim_workspace()
lsp.setup()
