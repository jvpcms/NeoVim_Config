local leap = require("leap")

leap.set_default_mappings()
leap.opts.case_sensitive = true

-- Preview filter
leap.opts.preview_filter =
function (ch0, ch1, ch2)
    return not (
        ch1:match('%s') or
        ch0:match('%a') and ch1:match('%a') and ch2:match('%a')
    )
end

-- Gray search area
vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
