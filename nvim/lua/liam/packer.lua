require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Markers
    use {
        'ThePrimeagen/harpoon',
        requires = { 'nvim-lua/plenary.nvim' }
    }

    -- LSP
    use {
        'neovim/nvim-lspconfig',
        requires = {
            -- Automatically install LSPs to stdpath for neovim
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            -- Useful status updates for LSP
            'j-hui/fidget.nvim',

            -- Neovim LSP
            'folke/neodev.nvim',
        }
    }

    -- Rust-specific
    use 'simrat39/rust-tools.nvim'

    -- Autocompletion
    use {
        'hrsh7th/nvim-cmp',
        requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
    }

    -- Add icons to nvim-cmp
    use 'onsails/lspkind.nvim'

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            pcall(require('nvim-treesitter.install').update { with_sync = true })
        end,
    }
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'nvim-treesitter/nvim-treesitter-context'

    -- Telescope
    use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

    -- Git related
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    use 'lewis6991/gitsigns.nvim'

    -- Lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    }

    -- Comment
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- Indent Blankline
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('indent_blankline').setup {
                char = '┊',
                show_trailing_blankline_indent = false,
            }
        end
    }

    -- GitHub Copilot
    use 'zbirenbaum/copilot.lua'
    use {
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua" },
        config = function()
            require("copilot_cmp").setup()
        end
    }

    -- Debugging
    use 'mfussenegger/nvim-dap'
    use 'theHamsta/nvim-dap-virtual-text'
    use 'rcarriga/nvim-dap-ui'
    use 'nvim-telescope/telescope-dap.nvim'

    -- Rose Pine Colorscheme
    use {
        'rose-pine/neovim',
        as = 'rose-pine',
    }
end)
