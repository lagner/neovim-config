vim.opt.completeopt = { "menu", "menuone", "noselect" }

return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    -- event = { "BufReadPost", "BufNewFile", },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "onsails/lspkind.nvim", -- добавляет красивые иконки для саджестера
    },
    config = function()
        local cmp = require("cmp")
        local lspkind = require("lspkind")
        local keymaps = require("lagner.keymaps")

        cmp.setup {
            sources = {
                { name = "nvim_lsp" },
                { name = "path" },
                { name = "buffer" },
            },
            mapping = keymaps.cmp_keys(cmp),
            formatting = {
            format = lspkind.cmp_format({
                    mode = "symbol", -- show only symbol annotations
                    maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                    ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
                    show_labelDetails = true, -- show labelDetails in menu. Disabled by default
                })
            },
        }
    end,
}
