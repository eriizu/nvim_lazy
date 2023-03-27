require("neodev").setup({})

local lsp = require("lsp-zero")

lsp.preset("recommended")

-- (Optional) Configure lua language server for neovim
-- lsp.nvim_workspace()

lsp.configure("lua_ls", {
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                -- library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
})

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

-- Initialize rust_analyzer with rust-tools
local rust_lsp = lsp.build_options("rust_analyzer", {})
require("rust-tools").setup({
    server = rust_lsp,
    tools = {
        inlay_hints = {
            --            parameter_hints_prefix = "param: ",
            --            other_hints_prefix = "type: ",
        },
    },
})

require("lsp_signature").setup({
    hint_prefix = "sig: ",
    hint_enable = false,
    doc_lines = 0,
    floating_window_off_x = 0,
    handler_opts = {
        border = "rounded",
    },
})
