--vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
vim.opt_local.commentstring = "//%s"
vim.opt_local.autoindent = true
vim.opt_local.smartindent = true
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
vim.opt_local.tabstop = 4
vim.opt_local.expandtab = true
vim.opt_local.smarttab = true
vim.opt_local.cindent = true
vim.opt_local.cinoptions = "(0"
print("c/c++ opt loaded")
