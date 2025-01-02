return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
        local res = vim.system({
            'defaults', 'read', '-g', 'AppleInterfaceStyle',
        }, { text = true }):wait()
        local background = "light"
        if res.code == 0 then
            local system_theme_name = string.gsub(res.stdout, "%s+", "")
            system_theme_name = string.lower(system_theme_name)
            if system_theme_name == "dark" then
                background = "dark"
            end
        end
        vim.o.background = background
        vim.cmd([[colorscheme gruvbox]])
    end,
}
