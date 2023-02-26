--require("eriizu.remap")
require("eriizu.packer")
require("eriizu.plugins")
vim.opt.number = true
vim.opt.relativenumber = true

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>fd", vim.cmd.Ex)
vim.keymap.set({'n', 'x'}, 'cp', '"+y')
vim.keymap.set({'n', 'x'}, 'cv', '"+p')

vim.opt.cursorline = false
vim.opt.backspace = "indent,eol,start"
vim.opt.splitright = true
vim.opt.splitbelow = true
