local leap = require("leap")

leap.add_default_mappings()
leap.opts.case_sensitive = false

-- Disable jump to first match
leap.opts.safe_labels = {}

-- Gray search area
vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })

vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap-anywhere)')
