-- INFO: shows symbols outline in a side window
-- tags: UI, IDE

local icons = {
  File          = "[FIL]",
  Module        = "[MOD]",
  Namespace     = "[NSP]",
  Package       = "[PKG]",
  Class         = "[CLS]",
  Method        = "[MTH]",
  Property      = "[PRP]",
  Field         = "[FLD]",
  Constructor   = "[CTR]",
  Enum          = "[ENU]",
  Interface     = "[INT]",
  Function      = "[FUN]",
  Variable      = "[VAR]",
  Constant      = "[CST]",
  String        = "[STR]",
  Number        = "[NUM]",
  Boolean       = "[BOL]",
  Array         = "[ARR]",
  Object        = "[OBJ]",
  Key           = "[KEY]",
  Null          = "[NUL]",
  EnumMember    = "[EMB]",
  Struct        = "[STC]",
  Event         = "[EVT]",
  Operator      = "[OPR]",
  TypeParameter = "[TPR]",
}

local function config_aerial()
	require("aerial").setup({
		-- optionally use on_attach to set keymaps when aerial has attached to a buffer
		on_attach = function(bufnr)
			-- Jump forwards/backwards with '{' and '}'
			vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
			vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
		end,
		backends = { "treesitter", "lsp", "markdown", "man" },
		-- backends = { "lsp", "treesitter", "markdown", "man" },
		attach_mode = "global",
		layout = {
			width = 50,
			default_direction = "prefer_left",
			placement = "edge",
		},
		show_guides = true,
		nerd_font = "true",
		-- filter_kind = {
		-- 	"Class",
		-- 	"Constant",
		-- 	"Constructor",
		-- 	"Enum",
		-- 	"EnumMember",
		-- 	"Field",
		-- 	"Function",
		-- 	"Interface",
		-- 	"Method",
		-- 	"Module",
		-- 	"Namespace",
		-- 	"Package",
		-- 	"Property",
		-- 	"Struct",
		-- },
		icons = icons,
	})
end

return {
	{
		"stevearc/aerial.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = {
			"onsails/lspkind.nvim",
			"nvim-treesitter/nvim-treesitter",
			-- "nvim-tree/nvim-web-devicons"
		},
		config = config_aerial,
		keys = {
			{
				"<leader>sa",
				function()
					require("aerial").focus()
				end,
				desc = "focus to symbol outline",
			},
			{ "<leader>st", "<cmd>AerialToggle!<CR>", desc = "toggle symbol outline" },
		},
	},
}
