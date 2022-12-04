-- Disable the swapfile / backup of files in buffers
vim.opt.swapfile = false
vim.opt.backup = false

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Misc.
vim.opt.guicursor = ""
vim.opt.wrap = false
vim.opt.colorcolumn = "80"
vim.opt.scrolloff = 8
vim.opt.errorbells = false

-- Give more space for displaying messages.
vim.opt.cmdheight = 1

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50
