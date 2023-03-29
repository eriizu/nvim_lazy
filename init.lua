require("eriizu")

-- configuration for plugins and features that only have vim API or an unstable/janky LUA API
local core_conf_files = {
    "fallback.vim",
}

-- source all the core config files
for _, name in ipairs(core_conf_files) do
    local path = string.format("%s/core/%s", vim.fn.stdpath("config"), name)
    local source_cmd = "source " .. path
    vim.cmd(source_cmd)
end

if vim.g.neovide then
    vim.o.guifont = "Fira Mono:h10"
    vim.g.neovide_padding_top = 5
    vim.g.neovide_padding_bottom = 5
    vim.g.neovide_padding_right = 5
    vim.g.neovide_padding_left = 5
    vim.g.neovide_transparency = 0.9
    vim.g.neovide_floating_blur_amount_x = 2.0
    vim.g.neovide_floating_blur_amount_y = 2.0
end

