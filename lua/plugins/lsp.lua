local function cmp_compare_snippets_last(entry1, entry2)
	print("hey")
	local kind1 = entry1:get_kind()
	local kind2 = entry2:get_kind()

	if kind1 ~= kind2 then
		local kind_orders = {
			[cmp.lsp.CompletionItemKind.Snippet] = 100,
		}
		local kind1_order = kind_orders[kind1] or 1
		local kind2_order = kind_orders[kind2] or 1
		return kind1_order < kind2_order
	end
end

return {
	-- Mason
	{
		"mason-org/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},

	-- Mason-lspconfig
	{
		"mason-org/mason-lspconfig.nvim",
		lazy = false,
		dependencies = { "mason-org/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls" },
				automatic_enable = {
					exclude = {
						"rust_analyzer"
					}
				}
			})
		end,
	},

	-- LuaSnip
	{
		"L3MON4D3/LuaSnip",
		lazy = false,
		commit = "458560534a73f7f8d7a11a146c801db00b081df0",
		config = function()
			require("luasnip").setup({})
		end,
	},

	-- nvim-cmp
	{
		"hrsh7th/nvim-cmp",
		lazy = false,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			cmp.setup({
				completion = {
					completeopt = "menu,menuone,noinsert,noselect",
				},
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						else
							fallback()
						end
					end),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						else
							fallback()
						end
					end),
					['<C-f>'] = cmp.mapping(function(fallback)
						local luasnip = require('luasnip')
						if luasnip.locally_jumpable(1) then
							luasnip.jump(1)
						else
							fallback()
						end
					end, {'i', 's'}),
					['<C-y>'] = cmp.mapping.confirm({select = true}),
					-- scroll up and down the documentation window
					['<C-u>'] = cmp.mapping.scroll_docs(-4),
					['<C-d>'] = cmp.mapping.scroll_docs(4),
				}),
				sources = {
					{ name = "path" },
					{ name = "nvim_lsp" },
					{ name = "luasnip", keyword_length = 2 },
				},
				sorting = {
					priority_weight = 2,
					comparators = {
						cmp.config.compare.offset,
						cmp.config.compare.exact,
						cmp.config.compare.score,
						cmp.config.compare.recently_used,
						cmp.config.compare.locality,
						--		cmp.config.compare.sort_text,
						cmp.config.compare.length,
						cmp.config.compare.order,
						cmp_compare_snippets_last,
					},
				},
			})
		end,
	},

	-- cmp-nvim-lsp
	{
		"hrsh7th/cmp-nvim-lsp",
		lazy = false,
	},

	-- nvim-lspconfig
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			"mason-org/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			require("mason-lspconfig").setup({
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,
			})
			vim.lsp.config('clangd', {
				-- Server-specific settings. See `:help lsp-quickstart`
				cmd = {"clangd", "--fallback-style=WebKit" } -- Your override
			})
		end,
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^6", -- Recommended
		lazy = false, -- This plugin is already lazy
		config = function()
			vim.g.rustaceanvim = {
				tools = {
					enable_clippy = false,
				},
			}
		end,
		-- ft = "rust",
	},
}
