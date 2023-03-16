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
