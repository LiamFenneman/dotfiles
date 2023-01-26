local keymap = require("liam.keymap");
local nnoremap = keymap.nnoremap;

vim.g.mapleader = " "
nnoremap("<leader>qq", "<cmd>Ex<CR>");

-- Auto center screen when paging up/down
nnoremap("<C-d>", "<C-d>zz");
nnoremap("<C-u>", "<C-u>zz");

-- Copy-Paste to Register
vim.keymap.set("n", "<leader>y", "\"+y");
vim.keymap.set("v", "<leader>y", "\"+y");
