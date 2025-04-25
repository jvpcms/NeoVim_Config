-- Disable default Tab mapping
vim.g.copilot_no_tab_map = true

vim.api.nvim_set_keymap("i", "<M-k>", 'copilot#Accept("<CR>")', { expr = true, silent = true })
vim.api.nvim_set_keymap("i", "<M-h>", "<Plug>(copilot-dismiss)", {})
vim.api.nvim_set_keymap("i", "<M-;>", "<Plug>(copilot-next)", {})

-- Accept one word
local function SuggestOneWord()
    local suggestion = vim.fn['copilot#Accept']("")
    local bar = vim.fn['copilot#TextQueuedForInsertion']()
    return vim.fn.split(bar,  [[[ .]\zs]])[1]
end

vim.keymap.set('i', '<M-l>', SuggestOneWord, {expr = true, remap = false})

-- Accept one line
local function suggest_line()
  return vim.fn["copilot#Accept"]("\n")
end

vim.keymap.set("i", "<M-j>", suggest_line, { expr = true, silent = true, script = true })
