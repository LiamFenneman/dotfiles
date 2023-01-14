local zen = require("zen-mode")
zen.setup({
    window = {
        width = 120,
        options = {
            signcolumn = "yes",
            number = true,
            relativenumber = true,
            wrap = false,
        },
    },
    plugins = {
        kitty = {
            enabled = true,
            font = "+4",
        },
    },
    on_open = function (win)
        vim.api.nvim_set_hl(0, "ZenBg", { ctermbg = 0 })
    end
})

local nnoremap = require("liam.keymap").nnoremap;

nnoremap("<leader>zz", zen.toggle)
