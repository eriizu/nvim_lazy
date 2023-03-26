vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = false
vim.opt.backspace = "indent,eol,start"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = "tab:»-,nbsp:+,trail:·,extends:→,precedes:←"
vim.opt.wildignore = ".git,.hg,.svn,*.pyc,*.o,*.jpg,*.jpeg,*.png,*.gif,*.zip,*.DS_Store,**/node_modules/**,**/bower_modules/**"
vim.opt.showmode = false
vim.g.mapleader = " "

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})
