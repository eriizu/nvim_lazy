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
				ensure_installed = { "lua_ls", "ts_ls", "biome" },
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

			local types = require("cmp.types")

			local function deprioritize_snippet(entry1, entry2)
				local kind1 = entry1:get_kind()
				local kind2 = entry2:get_kind()
				-- If entry1 is NOT a snippet and entry2 IS a snippet, entry1 should come first
				if kind1 ~= types.lsp.CompletionItemKind.Snippet
					and kind2 == types.lsp.CompletionItemKind.Snippet
				then
					return true
				end
				-- If entry1 IS a snippet and entry2 is NOT, entry1 should come after
				if kind1 == types.lsp.CompletionItemKind.Snippet
					and kind2 ~= types.lsp.CompletionItemKind.Snippet
				then
					return false
				end
				-- otherwise keep other comparators’ order
			end

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
						deprioritize_snippet,
						cmp.config.compare.recently_used,
						cmp.config.compare.kind,
						cmp.config.compare.sort_text,
						cmp.config.compare.length,
						cmp.config.compare.order,
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

			vim.lsp.config("*", { capabilities = capabilities })

			vim.lsp.config("clangd", {
				cmd = { "clangd", "--fallback-style=WebKit" },
			})

			vim.lsp.config("denols", {
				workspace_required = true,
				root_markers = { "deno.json", "deno.jsonc" },
			})

			vim.lsp.config("ts_ls", {
				-- The new API supports these fields
				workspace_required = true,
				root_markers = {
					"bun.lock", "bun.lockb",
					"package.json", "tsconfig.json", "jsconfig.json",
					"pnpm-lock.yaml", "yarn.lock", "package-lock.json",
				},
				-- If you also have deno projects and want to skip them:
				-- root_dir = function(fname)
				--   local util = require("lspconfig.util")
				--   if util.root_pattern("deno.json", "deno.jsonc")(fname) then
				--     return nil
				--   end
				--   return util.root_pattern(
				--     "bun.lock","bun.lockb","package.json","tsconfig.json","jsconfig.json",
				--     "pnpm-lock.yaml","yarn.lock","package-lock.json",".git"
				--   )(fname)
				-- end,
			})

			vim.lsp.config("html", {
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
				end,
			})

			vim.lsp.config("biome", {
				cmd = { "biome", "lsp-proxy" },
				root_markers = { "biome.json", "biome.jsonc", "package.json", ".git" },
				capabilities = capabilities,
			})

			-- Optional if you don’t rely on automatic_enable:
			-- vim.lsp.enable({ "lua_ls", "ts_ls", "denols", "clangd" })
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
	{
		"ray-x/lsp_signature.nvim",
		event = "InsertEnter",
		opts = {
			hint_prefix = "👉👈 ",
			hint_enable = false,
			-- doc_lines = 0,
			-- floating_window_off_x = 10,
			handler_opts = {
				border = "rounded",
			},
			-- floating_window_above_cur_line = false,
			toggle_key = "<M-x>",
			toggle_key_flip_floatwin_setting = true,
		},
	}
}
