local treesitter = require('nvim-treesitter.configs')

treesitter.setup {
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = {
      "python",
      "javascript",
      "typescript",
      "c",
      "lua",
      "markdown",
      "markdown_inline",
  },

  ignore_install = { },
  modules = { },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldcolumn = '2'
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldtext = [[substitute(getline(v:foldstart), '\t', repeat(' ', &tabstop), 'g')..' ... '..(v:foldend - v:foldstart + 1)..' lines']]

vim.opt.fillchars = {
  fold = " ",              -- Remove dots
  foldopen = "▾",          -- Symbol when fold is open
  foldclose = "▸",         -- Symbol when fold is closed
  foldsep = " "            -- Separator between folds
}

vim.keymap.set('n', '<leader>fa', "za", { desc = "Toggle fold" })
vim.keymap.set('n', '<leader>ff', "zM", { desc = "Close all folds" })
vim.keymap.set('n', '<leader>fu', "zR", { desc = "Open all folds" })
