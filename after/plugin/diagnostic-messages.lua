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
  highlight DiagnosticVirtualTextError guifg=#FB4934 guibg=#353535
  highlight DiagnosticVirtualTextWarn guifg=#FABD2F guibg=#353535
  highlight DiagnosticVirtualTextInfo guifg=#8EC07C guibg=#353535
  highlight DiagnosticVirtualTextHint guifg=#83A598 guibg=#353535
]]
