-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    use("nvim-lua/plenary.nvim")
    use("theprimeagen/harpoon")
    use("nvim-telescope/telescope.nvim")

    -- Colors
    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })
    use("folke/tokyonight.nvim")
    use("ellisonleao/gruvbox.nvim")

    -- :VimBeGood
    use("theprimeagen/vim-be-good")
end)
