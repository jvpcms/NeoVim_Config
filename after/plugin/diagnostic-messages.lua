-- Diagnostics configuration (unchanged)
vim.diagnostic.config({
    virtual_text = {
        spacing = 4,
        prefix = "■",
    },
    severity_sort = true,
})

-- Diagnostic highlight (unchanged)
vim.cmd [[
  highlight DiagnosticVirtualTextError guifg=#CC241D guibg=#353535
  highlight DiagnosticVirtualTextWarn guifg=#D79921 guibg=#353535
  highlight DiagnosticVirtualTextInfo guifg=#689D6A guibg=#353535
  highlight DiagnosticVirtualTextHint guifg=#50FA7B guibg=#353535
]]
