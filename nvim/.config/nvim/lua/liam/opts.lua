-- [[ Options ]]

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.editorconfig = true

vim.o.number = true
vim.o.relativenumber = true

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.smartindent = true

vim.o.wrap = false
vim.o.textwidth = 100

vim.o.guicursor = ""
vim.o.mouse = "a"
vim.o.showmode = false
vim.o.clipboard = "unnamedplus"

vim.o.completeopt = "menuone,noselect"

vim.o.undofile = true
vim.o.swapfile = false
vim.o.backup = false

vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.inccommand = "split"

vim.o.signcolumn = "yes"
vim.wo.colorcolumn = "100"

vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.cursorline = true
vim.o.errorbells = false
vim.o.scrolloff = 10

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.list = true
vim.o.listchars = "tab:» ,trail:·,nbsp:␣"
-- TODO: why is this not working?
-- vim.o.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
