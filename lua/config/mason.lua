local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

-- Install LSP servers
mason.setup()
mason_lspconfig.setup({
    ensure_installed = { "pyright", "lua_ls" },
    automatic_installation = true,
})
