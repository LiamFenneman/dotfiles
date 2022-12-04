local keymap = require("liam.keymap");

local nnoremap = keymap.nnoremap;

vim.g.mapleader = " "
nnoremap("<leader>qq", "<cmd>Ex<CR>");

nnoremap("<C-d>", "<C-d>zz");
nnoremap("<C-u>", "<C-u>zz");
