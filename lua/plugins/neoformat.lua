return {
	{
		"stevearc/conform.nvim",
		lazy = true,
		keys = {
			{
				"<leader>rn",
				function()
					require("conform").format({ async = true, lsp_format = "prefer" })
				end,
				desc = "refactor format"
			}
		},
		opts = {
			formatters_by_ft = {
				html = { "biome" },
			},
			default_format_opts = {
				lsp_format = "prefer",
			},
			format_on_save = function(bufnr)
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				return { timeout_ms = 500, lsp_format = "prefer" }
			end,
		},
	}
}
