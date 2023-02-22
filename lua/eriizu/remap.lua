vim.g.mapleader = " "
vim.keymap.set("n", "<leader>fd", vim.cmd.Ex)
vim.keymap.set({'n', 'x'}, 'cp', '"+y')
vim.keymap.set({'n', 'x'}, 'cv', '"+p')
