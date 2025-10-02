local lspconfig = require("lspconfig")
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
local mason_registry = require("mason-registry")

local vue_language_server = mason_registry.get_package("vue-language-server")
local vue_language_server_path = vue_language_server:get_install_path() .. "/node_modules/@vue/language-server"

lspconfig.lua_ls.setup({
    capabilities = lsp_capabilities,
    settings = {
        Lua = {
            runtime = { version = "LuaJIT" },
            workspace = {
                checkThirdParty = false,
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = { enable = false },
            diagnostics = { globals = { "vim" } },
        },
    },
})

lspconfig.pyright.setup({
    capabilities = lsp_capabilities,
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "basic",
                autoImportCompletions = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
                diagnosticSeverityOverrides = {
                    reportMissingDocstring = "hint",
                },
            },
        },
    },
})

lspconfig.ts_ls.setup({
    capabilities = lsp_capabilities,
    init_options = {
        plugins = {
            {
                name = "@vue/typescript-plugin",
                location = vue_language_server_path,
                languages = { "vue" },
            },
        },
    },
    filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
})

lspconfig.julials.setup({
    capabilities = lsp_capabilities,
    settings = {
        julia = {
            format = { indent = 4 },
            lint = { missingrefs = "none" },
        },
    },
})

-- Set up LSP keymaps when LSP attaches to a buffer
local lspAucmdGroup = vim.api.nvim_create_augroup("UserLspConfig", {})
vim.api.nvim_create_autocmd("LspAttach", {
    group = lspAucmdGroup,
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- LSP keymaps
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "grn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "grr", vim.lsp.buf.references, opts)
    end,
})

-- Set an lsp restart keymap
vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart<CR>", { desc = "Restart LSP" })

-- Diagnostics configuration
vim.diagnostic.config({
    virtual_text = {
        spacing = 4,
        prefix = "■",
    },
    severity_sort = true,
})

-- Diagnostic highlight
vim.cmd([[
  highlight DiagnosticVirtualTextError guifg=#FB4934 guibg=#353535
  highlight DiagnosticVirtualTextWarn guifg=#FABD2F guibg=#353535
  highlight DiagnosticVirtualTextInfo guifg=#8EC07C guibg=#353535
  highlight DiagnosticVirtualTextHint guifg=#83A598 guibg=#353535
]])

-- Quickfix list configuration-- Auto-populate quickfix list on diagnostics change
local qfAucmdGroup = vim.api.nvim_create_augroup("UserQfConfig", {})
vim.api.nvim_create_autocmd("DiagnosticChanged", {
    group = qfAucmdGroup,
    pattern = "*",
    callback = function()
        vim.diagnostic.setqflist({ title = "Diagnostics", open = false })
    end,
})
