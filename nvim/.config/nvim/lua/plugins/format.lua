return {
    {
        "stevearc/conform.nvim",
        keys = {
            {
                "<leader>f",
                mode = "n",
                function()
                    require("conform").format({ async = true, lsp_fallback = true })
                end,
                desc = "[F]ormat buffer",
            },
        },
        opts = {
            notify_on_error = false,
            format_on_save = false,
            formatters_by_ft = {
                lua = { "stylua" },
                yaml = { "yamlfmt" },
                nix = { "nixpkgs_fmt" },
                ["_"] = { "trim_whitespace" },
            },
        },
    },
}
