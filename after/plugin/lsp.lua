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
                library = vim.api.nvim_get_runtime_file("", true)
            },
            telemetry = { enable = false },
            diagnostics = { globals = { "vim" }, },
        }
    }
})

lspconfig.pyright.setup({
    capabilities = lsp_capabilities,
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "basic",
                autoImportCompletions = true,
                useLibraryCodeForTypes = true,
            }
        }
    }
})

lspconfig.ts_ls.setup({
    capabilities = lsp_capabilities,
    init_options = {
        plugins = {
            {
                name = "@vue/typescript-plugin",
                location = vue_language_server_path,
                languages = { "vue" },
            }
        }
    },
    filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" }
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
vim.cmd [[
  highlight DiagnosticVirtualTextError guifg=#FB4934 guibg=#353535
  highlight DiagnosticVirtualTextWarn guifg=#FABD2F guibg=#353535
  highlight DiagnosticVirtualTextInfo guifg=#8EC07C guibg=#353535
  highlight DiagnosticVirtualTextHint guifg=#83A598 guibg=#353535
]]
