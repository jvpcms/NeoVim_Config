local builtin = require('telescope.builtin')

-- Fuzy find: Files in project, Git files, live grep
vim.keymap.set('n', '<leader>pf', function()
    builtin.find_files({
        no_ignore = true,                   -- don't respect .gitignore
        no_ignore_parent = true,            -- don't respect parent .gitignore
    })
end, { desc = 'Find all files (even gitignored)' })
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
