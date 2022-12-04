-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	use("theprimeagen/harpoon")
	
	use("nvim-lua/plenary.nvim")

    -- Colors
    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })
    use("folke/tokyonight.nvim")

    -- :VimBeGood
    use("theprimeagen/vim-be-good")
end)
