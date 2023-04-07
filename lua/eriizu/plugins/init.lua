require("eriizu.plugins.lsp-zero")
--require("eriizu.plugins.lspconfig")
require("eriizu.plugins.sonokai")
require("eriizu.plugins.telescope")
require("eriizu.plugins.treesitter")
require("eriizu.plugins.lualine")
require("eriizu.plugins.dap")
-- require("eriizu.plugins.wilder")
-- require("eriizu.plugins.vimspector")
require("fidget").setup({
    text = {
        spinner = "dots_bounce"
    },
    window = {
        blend = 0
    }
})

require("symbols-outline").setup()
