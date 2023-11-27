vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.backspace = "indent,eol,start"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = "tab:»-,nbsp:+,trail:·,extends:→,precedes:←"
vim.opt.wildignore =
".git,.hg,.svn,*.pyc,*.o,*.jpg,*.jpeg,*.png,*.gif,*.zip,*.DS_Store,**/node_modules/**,**/bower_modules/**"
vim.opt.showmode = false
vim.g.mapleader = " "

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*" },
	command = [[%s/\s\+$//e]],
})
vim.opt.colorcolumn = "80"

vim.keymap.set("n", "<leader>fd", vim.cmd.Ex, { desc = "explore directories", silent = true })
vim.keymap.set({ "n", "x" }, "cp", '"+y')
vim.keymap.set({ "n", "x" }, "cv", '"+p')
vim.keymap.set({ "n", "x" }, "<leader>bn", ":bNext<enter>")
vim.keymap.set({ "n", "x" }, "<leader>bp", ":bprevious<enter>")

vim.keymap.set("t", "<C-W>", "<C-\\><C-n>")

vim.keymap.set("n", "<leader>tc", ":tabnew<cr>", { desc = "tab create", silent = true })
vim.keymap.set("n", "<leader>tn", ":tabnext<cr>", { desc = "tab next", silent = true })
vim.keymap.set("n", "<leader>tp", ":tabprevious<cr>", { desc = "tab previous", silent = true })
vim.keymap.set("n", "<leader>tx", ":tabclose<cr>", { desc = "tab close", silent = true })

vim.keymap.set("n", "<M-right>", ":tabnext<cr>", { desc = "tab next", silent = true })
vim.keymap.set("n", "<M-left>", ":tabprevious<cr>", { desc = "tab previous", silent = true })
vim.keymap.set("i", "jj", "<Esc>", { silent = true });
