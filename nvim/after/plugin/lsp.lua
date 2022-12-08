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

lsp.set_preferences({
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function (client, bufnr)
    local noremap = {buffer = bufnr, remap = false}
    local bind = vim.keymap.set

    bind("n", "R", vim.lsp.buf.rename, noremap)
    bind("n", "ca", vim.lsp.buf.code_action, noremap)
end)

lsp.nvim_workspace()
lsp.setup()
