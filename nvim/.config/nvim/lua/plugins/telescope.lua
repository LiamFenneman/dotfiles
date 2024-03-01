return {
    -- Fuzzy Finder (files, lsp, etc)
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = function()
                return vim.fn.executable("make") == 1
            end,
        },
        { "nvim-telescope/telescope-ui-select.nvim" },
        { "nvim-tree/nvim-web-devicons" },
    },
    config = function()
        --  See: `:help telescope.setup()`
        require("telescope").setup({
            pickers = {
                find_files = {
                    find_command = {
                        "rg",
                        "--files",
                        "--hidden",
                        "--ignore",
                        "-u",
                        "--glob=!**/.git/*",
                        "--glob=!**/.direnv/*",
                        "--glob=!**/node_modules/*",
                        "--glob=!**/target/*",
                    },
                },
            },
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown(),
                },
            },
        })

        -- Enable telescope extensions, if they are installed
        pcall(require("telescope").load_extension, "fzf")
        pcall(require("telescope").load_extension, "ui-select")

        local function nmap(key, f, desc, opts)
            opts = opts or {}
            vim.keymap.set("n", key, f, { desc = desc })
        end

        -- See `:help telescope.builtin`
        local builtin = require("telescope.builtin")
        nmap("<leader>sh", builtin.help_tags, "[S]earch [H]elp")
        nmap("<leader>sk", builtin.keymaps, "[S]earch [K]eymaps")
        nmap("<leader>sf", builtin.find_files, "[S]earch [F]iles")
        nmap("<leader>ss", builtin.builtin, "[S]earch [S]elect Telescope")
        nmap("<leader>sw", builtin.grep_string, "[S]earch current [W]ord")
        nmap("<leader>sg", builtin.live_grep, "[S]earch by [G]rep")
        nmap("<leader>sd", builtin.diagnostics, "[S]earch [D]iagnostics")
        nmap("<leader>sr", builtin.resume, "[S]earch [R]esume")
        nmap("<leader>s.", builtin.oldfiles, '[S]earch Recent Files ("." for repeat)')
        nmap("<leader><leader>", builtin.buffers, "[ ] Find existing buffers")

        nmap("<leader>/", function()
            builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                winblend = 10,
                previewer = false,
            }))
        end, "[/] Fuzzily search in current buffer")

        --  See `:help telescope.builtin.live_grep()`
        nmap("<leader>s/", function()
            builtin.live_grep({
                grep_open_files = true,
                prompt_title = "Live Grep in Open Files",
            })
        end, "[S]earch [/] in Open Files")

        -- Shortcut for searching your neovim configuration files
        nmap("<leader>sn", function()
            builtin.find_files({
                cwd = vim.fn.stdpath("config"),
            })
        end, "[S]earch [N]eovim files")
        nmap("<leader>sm", function()
            builtin.find_files({
                cwd = "~/nix-config/",
            })
        end, "[S]earch [N]eovim files")
    end,
}
