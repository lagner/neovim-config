return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost" },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend(
            "force", 
            capabilities,
            require("cmp_nvim_lsp").default_capabilities()
        )

        local servers = {
            lua_ls = {
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        workspace = {
                            checkThirdParty = false,
                            -- Tells lua_ls where to find all the Lua files that you have loaded
                            -- for your neovim configuration.
                            library = {
                                "${3rd}/luv/library",
                                unpack(vim.api.nvim_get_runtime_file("", true)),
                            },
                        },
                        telemetry = { enabled = false },
                    },
                },
            },
            pyright = {},
            jsonls = {},
            clangd = {},
            kotlin_language_server = {},
            yamlls = {},
        }

        local on_attach = function(_client, buffer_number)
            -- пока не знаю зачем это нужно
            -- https://github.com/dmmulroy/kickstart.nix/blob/main/config/nvim/lua/plugins/lsp.lua
            -- Pass the current buffer to map lsp keybinds
            -- map_lsp_keybinds(buffer_number)
        end

        local lspconfig = require("lspconfig")

        for name, config in pairs(servers) do
            lspconfig[name].setup {
                autostart = config.autostart,
                cmd = config.cmd,
                capabilities = capabilities,
                filetypes = config.filetypes,
                handlers = vim.tbl_deep_extend("force", {}, {}, config.handlers or {}),
                on_attach = on_attach,
                settings = config.settings,
                root_dir = config.root_dir,
            }
        end

        require("mason").setup()
        require("mason-lspconfig").setup {
            ensure_installed = {
                "lua_ls",
                "jsonls",
                "pyright",
                "clangd",
                "kotlin_language_server",
                "yamlls",
            },
        }
    end,
}
