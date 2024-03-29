local function config()
	local lsp = require("lsp-zero")

	lsp.preset("recommended")
	lsp.setup_nvim_cmp({
		preselect = "none",
		completion = {
			completeopt = "menu,menuone,noinsert,noselect",
		},
		sources = {
			{ name = "path" },
			{ name = "nvim_lsp" },
			{ name = "luasnip", keyword_length = 2 },
		},
	})

	lsp.skip_server_setup({ "rust_analyzer" })
	lsp.setup()
end

return {

	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		config = config,
		lazy = false,
		dependencies = {
			{ "neovim/nvim-lspconfig" },
			{
				"williamboman/mason.nvim",
				build = "MasonUpdate<cr>",
			},
			{ "williamboman/mason-lspconfig.nvim" },
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{
				"folke/neodev.nvim",
				config = function()
					require("neodev").setup()
				end,
			},
		},
		keys = {
			{
				"<leader>rf",
				function()
					vim.lsp.buf.format()
				end,
				desc = "refactor lsp format",
			},
		},
	},
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "1", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
	},
}
