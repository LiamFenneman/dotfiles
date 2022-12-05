local keymap = require("liam.keymap");
local nnoremap = keymap.nnoremap;

vim.g.mapleader = " "
nnoremap("<leader>qq", "<cmd>Ex<CR>");

-- Auto center screen when paging up/down
nnoremap("<C-d>", "<C-d>zz");
nnoremap("<C-u>", "<C-u>zz");

-- Rust
nnoremap("<leader>rr", "<cmd>! cargo run<CR>");
nnoremap("<leader>rc", "<cmd>! cargo check<CR>");
nnoremap("<leader>rt", "<cmd>! cargo test<CR>");
