local leap = require("leap")

leap.set_default_mappings()
leap.opts.case_sensitive = true

-- Disable jump to first match
leap.opts.safe_labels = {}

-- Gray search area
vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })

