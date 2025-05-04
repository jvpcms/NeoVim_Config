local gitsigns = require("gitsigns")

-- Define the required highlight groups
vim.api.nvim_set_hl(0, "GitSignsAddNr", { link = "GitSignsAdd" })
vim.api.nvim_set_hl(0, "GitSignsChangeNr", { link = "GitSignsChange" })
vim.api.nvim_set_hl(0, "GitSignsDeleteNr", { link = "GitSignsDelete" })
vim.api.nvim_set_hl(0, "GitSignsChangedeleteNr", { link = "GitSignsChange" })
vim.api.nvim_set_hl(0, "GitSignsTopdeleteNr", { link = "GitSignsDelete" })

-- Configure gitsigns with the new highlight groups
gitsigns.setup({
    sign_priority = 100,
    signs = {
        add = { show_count = false },
        change = { show_count = false },
        delete = { show_count = true },
        topdelete = { show_count = true },
        changedelete = { show_count = true },
    },
})
