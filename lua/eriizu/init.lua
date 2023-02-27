--require("eriizu.remap")
require("eriizu.opt")
require("eriizu.keymap")
require("eriizu.packer")
require("eriizu.plugins")
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})
