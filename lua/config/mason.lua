local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local mason_null_ls = require("mason-null-ls")

-- Install LSP servers
mason.setup()
mason_lspconfig.setup({
    ensure_installed = {
        "pyright",
        "lua_ls",
        "ts_ls",
        "volar",
        "julials",
    },
    automatic_installation = true,
})

-- Install formatters and linters
mason_null_ls.setup({
    ensure_installed = {
        "black",
        "prettier",
        "stylua",
    },
    automatic_installation = true,
})
