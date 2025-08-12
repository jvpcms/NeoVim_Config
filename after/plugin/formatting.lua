local null_ls = require("null-ls")

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.prettier.with({
            extra_args = { "--print-width", "80" },
        }),
        null_ls.builtins.formatting.stylua,
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            -- vim.api.nvim_create_autocmd("BufWritePre", {
            --     group = augroup,
            --     buffer = bufnr,
            --     callback = function()
            --         vim.lsp.buf.format()
            --     end,
            -- })
        end
    end,
})

-- Keymaps for formatting
vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, { desc = "Format with null-ls" })
