local trouble = require("trouble")

trouble.setup({})

vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
vim.keymap.set(
    "n",
    "<leader>xX",
    "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
    { desc = "Workspace Diagnostics (Trouble)" }
)
vim.keymap.set(
    "n",
    "<leader>xs",
    "<cmd>Trouble symbols toggle focus=false<cr>",
    { desc = "Document Diagnostics (Trouble)" }
)
vim.keymap.set(
    "n",
    "<leader>xl",
    "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
    { desc = "LSP References (Trouble)" }
)
vim.keymap.set("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
vim.keymap.set("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })
