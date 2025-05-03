local neotree = require("neo-tree")

vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle float<CR>")

-- Show hidden files by default
neotree.setup {
    filesystem = {
        filtered_items = {
            visible = true,
            hide_gitignored = true,
        },
    },
}
