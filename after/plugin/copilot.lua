-- Disable default Tab mapping
vim.g.copilot_no_tab_map = true

vim.api.nvim_set_keymap("i", "<M-e>", 'copilot#Accept("<CR>")', { expr = true, silent = true })
vim.api.nvim_set_keymap("i", "<M-s>", "<Plug>(copilot-dismiss)", {})
vim.api.nvim_set_keymap("i", "<M-r>", "<Plug>(copilot-next)", {})

-- Accept one word
local function SuggestOneWord()
    local suggestion = vim.fn['copilot#Accept']("")
    local bar = vim.fn['copilot#TextQueuedForInsertion']()
    return vim.fn.split(bar,  [[[ .]\zs]])[1]
end

vim.keymap.set('i', '<M-f>', SuggestOneWord, {expr = true, remap = false})

-- Accept only one line from current Copilot suggestion, preserve the rest
local function SuggestOneLine()
    local suggestion = vim.fn['copilot#Accept']("")
    local bar = vim.fn['copilot#TextQueuedForInsertion']()
    local first_line = vim.fn.split(bar, "\n")[1]
    return first_line .. "\n"
end

vim.keymap.set("i", "<M-d>", SuggestOneLine, {expr = true, remap = false})

