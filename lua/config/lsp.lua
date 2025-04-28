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
                        workspace = {
                            checkThirdParty = false,
                            library = vim.api.nvim_get_runtime_file("", true)
                        },
                        telemetry = { enable = false },
                        diagnostics = { globals = { "vim" }, },
                    }
                }
            end

            lspconfig[server_name].setup(opts)
        end,
    },
})

-- Set up LSP keymaps when LSP attaches to a buffer
local lspAucmdGroup = vim.api.nvim_create_augroup('UserLspConfig', {})
vim.api.nvim_create_autocmd('LspAttach', {
    group = lspAucmdGroup,
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- LSP keymaps
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'grn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', 'grr', vim.lsp.buf.references, opts)
    end,
})

-- nvim-cmp setup (fixed)
cmp.setup({
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = 'buffer' },
        { name = 'path' },
    }),
    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
    }),
    completion = {
        completeopt = "menu,menuone,noinsert",
    },
})
