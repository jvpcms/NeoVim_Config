-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- You can add your own keymaps here

-- Change 'd' to delete without copying to clipboard
vim.keymap.set({ "n", "v" }, "d", '"_d')
vim.keymap.set({ "n", "v" }, "D", '"_D')
vim.keymap.set({ "n" }, "dd", '"_dd')

-- Make select and paset not fill clipboard
vim.keymap.set("v", "p", '"_dP', { noremap = true, silent = true })
