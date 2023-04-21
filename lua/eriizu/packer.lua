-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    -- Simple plugins can be specified as strings
    use("rstacruz/vim-closer")

    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        -- or                            , branch = '0.1.x',
        requires = { { "nvim-lua/plenary.nvim" } },
    })
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use("sainnhe/sonokai")
    -- LSP
    use({
        "VonHeikemen/lsp-zero.nvim",
        branch = "v1.x",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" }, -- Required
            { "williamboman/mason.nvim" }, -- Optional
            { "williamboman/mason-lspconfig.nvim" }, -- Optional

            -- Autocompletion
            { "hrsh7th/nvim-cmp" }, -- Required
            { "hrsh7th/cmp-nvim-lsp" }, -- Required
            { "hrsh7th/cmp-buffer" }, -- Optional
            { "hrsh7th/cmp-path" }, -- Optional
            { "saadparwaiz1/cmp_luasnip" }, -- Optional
            { "hrsh7th/cmp-nvim-lua" }, -- Optional

            -- Snippets
            { "L3MON4D3/LuaSnip" }, -- Required
            { "rafamadriz/friendly-snippets" }, -- Optional
        },
    })
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })
    use("simrat39/rust-tools.nvim")
    use("gpanders/editorconfig.nvim")
    use("sbdchd/neoformat")
    use("mfussenegger/nvim-dap")
    use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
    -- use({ "gelguy/wilder.nvim", requires = { "romgrk/fzy-lua-native" } })
    use("dpelle/vim-Grammalecte")
    use("ray-x/lsp_signature.nvim")
    use("j-hui/fidget.nvim")
    use("arkav/lualine-lsp-progress")
    use("folke/neodev.nvim")
    use("simrat39/symbols-outline.nvim")
    use({
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
    })
end)
