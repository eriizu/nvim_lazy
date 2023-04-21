local builtin = require("telescope.builtin")

local actions = require("telescope.actions")
require("telescope").setup({
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close,
            },
        },
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
            prompt_position = "top",
        },
    },
})

vim.keymap.set("n", "<leader>fr", builtin.git_files, {})
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<C-t>", builtin.find_files, {})
vim.keymap.set("n", "<leader>fs", function() builtin.grep_string({ search = vim.fn.input("find string: ") }) end)
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>sd", builtin.lsp_document_symbols, { desc = "[S]ymbols [D]ocument" })
vim.keymap.set("n", "<leader>sw", builtin.lsp_dynamic_workspace_symbols, { desc = "[S]ymbols [W]orkspace" })
