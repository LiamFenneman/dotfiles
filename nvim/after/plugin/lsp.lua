local nnoremap = require("liam.keymap").nnoremap

nnoremap("<leader>h", function () vim.lsp.buf.hover() end)

local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    "tsserver",
    "eslint",
    "sumneko_lua",
})

lsp.set_preferences({
    sign_icons = {}
})

lsp.nvim_workspace()
lsp.setup()
