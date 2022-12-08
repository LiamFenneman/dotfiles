-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")
    use("nvim-lua/plenary.nvim")

    -- Markers
    use("theprimeagen/harpoon")

    -- Fuzzy finder
    use("nvim-telescope/telescope.nvim")

    -- LSP
    use({
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    })

    use("tpope/vim-fugitive")
    use("mbbill/undotree")
    use("folke/zen-mode.nvim")

    -- Colors
    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })
    use("folke/tokyonight.nvim")
    use("ellisonleao/gruvbox.nvim")
    use("rose-pine/neovim")

    -- :VimBeGood
    use("theprimeagen/vim-be-good")
end)
