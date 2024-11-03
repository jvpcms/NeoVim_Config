-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- You can add your own keymaps here

-- Change 'd' to delete without copying to clipboard
vim.keymap.set({ "n", "v" }, "d", '"_d')
vim.keymap.set({ "n", "v" }, "D", '"_D')
vim.keymap.set({ "n" }, "dd", '"_dd')

-- Make select and paset not fill clipboard
vim.keymap.set("v", "p", '"_dP', { noremap = true, silent = true })

-- Copilot keymaps
-- Toggle Copilot suggestion
vim.api.nvim_set_keymap(
  "n",
  "<leader>ct",
  ":Copilot toggle<CR>",
  { noremap = true, silent = true, desc = "Toggle Copilot" }
)

-- Disable Tab mapping
-- vim.g.copilot_no_tab_map = true

-- Map <C-l> to accept Copilot suggestion
-- vim.api.nvim_set_keymap("i", "<C-l>", 'copilot#Accept("")', { silent = true, expr = true })

-- Optional: Map <C-[> and <C-]> to navigate through suggestions
-- vim.api.nvim_set_keymap("i", "<C-]>", "copilot#Next()", { silent = true, expr = true })
-- vim.api.nvim_set_keymap("i", "<C-[>", "copilot#Previous()", { silent = true, expr = true })

-- Optional: Map <C-s> to dismiss Copilot suggestion
-- vim.api.nvim_set_keymap("i", "<C-s>", "copilot#Dismiss()", { silent = true, expr = true })
