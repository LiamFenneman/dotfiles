return {
    -- Automatically set the indent settings based on the file being edited
    "tpope/vim-sleuth",

    {
        "LiamFenneman/quick-run.nvim",
        opts = {
            mappings = {
                quick_run = "<F5>",
            },
        },
    },

    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon = require("harpoon")
            harpoon:setup()

            vim.keymap.set("n", "<leader>a", function()
                harpoon:list():add()
            end)
            vim.keymap.set("n", "<leader>e", function()
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end)

            for _, idx in ipairs { 1, 2, 3, 4, 5 } do
                vim.keymap.set("n", string.format("<leader>%d", idx), function()
                    harpoon:list():select(idx)
                end)
            end
        end,
    },

    {
        "numToStr/Comment.nvim",
        opts = {
            mappings = {
                basic = true,
                extra = false,
            },
        },
    },

    -- Adds git related signs to the gutter, as well as utilities for managing changes
    -- See `:help gitsigns.txt`
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            signs = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
            },
        },
    },

    -- Highlight todo, notes, etc in comments
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = { signs = false },
    },

    {
        "folke/which-key.nvim",
        event = "VimEnter",
        config = function()
            require("which-key").setup()
            require("which-key").register({
                ["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
                ["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
                ["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
                ["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
                ["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
            })
        end,
    },

    -- Collection of various small independent plugins/modules
    --  See: https://github.com/echasnovski/mini.nvim
    {
        "echasnovski/mini.nvim",
        config = function()
            -- Better Around/Inside textobjects
            --
            -- Examples:
            --  - va)  - [V]isually select [A]round [)]parenthen
            --  - yinq - [Y]ank [I]nside [N]ext [']quote
            --  - ci'  - [C]hange [I]nside [']quote
            require("mini.ai").setup({ n_lines = 500 })

            -- Add/delete/replace surroundings (brackets, quotes, etc.)
            --
            -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
            -- - sd'   - [S]urround [D]elete [']quotes
            -- - sr)'  - [S]urround [R]eplace [)] [']
            require("mini.surround").setup()
        end,
    },
}
