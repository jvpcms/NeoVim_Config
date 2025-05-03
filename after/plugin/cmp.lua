local cmp = require('cmp')

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

-- nvim-cmp setup
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
