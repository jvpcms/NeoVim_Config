local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>hm", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

-- Add buffer to harpoon
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<S-h>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<S-l>", function() harpoon:list():next() end)
