function rst_config()
	local lsp = require("lsp-zero")
	local rust_lsp = lsp.build_options("rust_analyzer", {})
	local extension_path = vim.env.HOME .. "/.local/share/nvim/codelldb/extension/"
	local codelldb_path = extension_path .. "adapter/codelldb"
	local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
	--print(codelldb_path)
	require("rust-tools").setup({
		server = rust_lsp,
		tools = {
			inlay_hints = {
				-- max_len_align = true,
				parameter_hints_prefix = " <- ",
				other_hints_prefix = " => ",
			},
		},
		dap = {
			adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
		},
	})

end
return {{"simrat39/rust-tools.nvim", config = rst_config, ft = {"rust", "rs"}}}
