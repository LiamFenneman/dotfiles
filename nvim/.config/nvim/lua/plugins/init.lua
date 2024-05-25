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
}
