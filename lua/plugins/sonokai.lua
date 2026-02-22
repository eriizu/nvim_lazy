return {
    -- {
    --     "sainnhe/edge",
    --     lazy = false,
    --     config = function()
    --         vim.g.edge_material_background = "medium"
    --         vim.g.edge_material_foreground = "material"
    --         if not vim.g.neovide then
    --             vim.g.edge_material_transparent_background = 1
    --         end
    --         vim.g.edge_material_better_performance = 1
    --         vim.g.edge_material_dim_inactive_windows = 0
    --         vim.g.edge_material_enable_italic = 1
    --         vim.g.edge_material_enable_bold = 0
    --         vim.opt.termguicolors = true
    --         vim.cmd([[colorscheme edge]])
    --     end
    -- },
    -- {
    --     "eriizu/gruvbox-material",
    --     branch = "master",
    --     lazy = false,
    --     enabled = false,
    --     config = function()
    --         vim.g.gruvbox_material_background = "medium"
    --         vim.g.gruvbox_material_foreground = "material"
    --         if not vim.g.neovide then
    --             vim.g.gruvbox_material_transparent_background = 1
    --         end
    --         vim.g.gruvbox_material_better_performance = 1
    --         vim.g.gruvbox_material_dim_inactive_windows = 0
    --         vim.g.gruvbox_material_enable_italic = 1
    --         vim.g.gruvbox_material_enable_bold = 0
    --         vim.opt.termguicolors = true
    --         vim.cmd([[colorscheme gruvbox-material]])
    --     end
    -- },
    {
        "eriizu/sonokai",
        -- dir = "/home/eriizu/Arena/20260221_sonokai_light/sonokai",
        lazy = false,
        enabled = true,
        config = function()
            vim.g.sonokai_style = "shusia"
            vim.g.sonokai_transparent_background = 0
            vim.g.sonokai_better_performance = 1
            vim.g.sonokai_dim_inactive_windows = 0
            vim.opt.termguicolors = true
            vim.cmd([[colorscheme sonokai]])
        end
    }
}
