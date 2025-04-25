local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

-- Mason
mason.setup()

mason_lspconfig.setup({
    ensure_installed = { "pyright" },
    automatic_installation = true,
})

-- LSP Config
