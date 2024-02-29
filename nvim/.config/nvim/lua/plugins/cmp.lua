return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        -- Sources
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-path",

        -- Snippets
        {
            "L3MON4D3/LuaSnip",
            build = (function()
                if vim.fn.executable("make") == 0 then
                    return
                end
                return "make install_jsregexp"
            end)(),
        },
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",

        -- Icons
        "onsails/lspkind.nvim",
    },
    config = function()
        -- See `:help cmp`
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local lspkind = require("lspkind")
        require("luasnip.loaders.from_vscode").lazy_load()
        luasnip.config.setup({})

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            completion = { completeopt = "menu,menuone,noinsert" },
            formatting = {
                format = lspkind.cmp_format({
                    mode = "symbol_text",
                    maxwidth = 50,
                    symbol_map = { Copilot = "" },
                    menu = {
                        buffer = "[Buffer]",
                        nvim_lsp = "[LSP]",
                        luasnip = "[LuaSnip]",
                    },
                }),
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-Space>"] = cmp.mapping.complete({}),
                ["<C-n>"] = cmp.mapping.select_next_item(),
                ["<C-p>"] = cmp.mapping.select_prev_item(),
                ["<CR>"] = cmp.mapping.confirm({
                    -- behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                }),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_locally_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),
            sources = {
                { name = "copilot" },
                { name = "nvim_lsp" },
                { name = "nvim_lsp_signature_help" },
                { name = "luasnip" },
                { name = "path" },
            },
        })
    end,
}
