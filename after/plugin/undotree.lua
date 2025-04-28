-- Keymap to toggle Undotree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- Undotree settings
vim.g.undotree_SetFocusWhenToggle = 1      -- Focus undotree window when toggled
vim.g.undotree_SplitWidth = 30              -- Width of the undotree window
vim.g.undotree_HighlightChangedText = 1     -- Highlight changed text
vim.g.undotree_HighlightChangedWithSign = 1 -- Highlight changed text with sign column
vim.g.undotree_DiffAutoOpen = 1              -- Automatically open diff panel
vim.g.undotree_DiffpanelHeight = 8           -- Height of diff panel
vim.g.undotree_WindowLayout = 2              -- Split layout: 2 = tree on right, diff below
