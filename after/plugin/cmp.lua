local cmp = require('cmp')

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
