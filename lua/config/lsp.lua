local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
local cmp = require("cmp")
local lspconfig = require("lspconfig")

-- Install LSP servers
mason.setup({})
mason_lspconfig.setup({
    ensure_installed = { "pyright", "lua_ls" },
    automatic_installation = true,
    handlers = {
        function(server_name)
            local opts = {
                capabilities = lsp_capabilities,
            }

            -- Server-specific configurations
            if server_name == "lua_ls" then
                opts.settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        workspace = { checkThirdParty = false },
                        telemetry = { enable = false },
                    }
                }
            end

            lspconfig[server_name].setup(opts)
        end,
    },
})

-- nvim-cmp setup (fixed)
cmp.setup({
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        -- Add other sources like buffer, path, etc.
    }),
    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
    }),
    completion = {
        completeopt = "menu,menuone,noinsert",
    },
})
