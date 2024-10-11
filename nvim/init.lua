-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Setup Pyright and Ruff LSP servers
local lspconfig = require("lspconfig")

-- Setup Pyright for Python LSP
lspconfig.pyright.setup({})

-- Accept completion with <C-l> in insert mode
vim.g.copilot_no_tab_map = true -- Disable default Tab mapping for Copilot
vim.api.nvim_set_keymap("i", "<C-l>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- Setup NeoTree
-- Show hidden viles by default
require("neo-tree").setup({
  filesystem = {
    filtered_items = {
      visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
      hide_dotfiles = false,
      hide_gitignored = true,
    },
    follow_current_file = {
      enabled = true,
    }, -- Keep NeoTree in sync with the current file
    use_libuv_file_watcher = true, -- Auto-refresh when files are changed externally
  },
  window = {
    mappings = {
      ["l"] = "open", -- Press 'l' to open subfolders
      ["<CR>"] = "open", -- Make sure Enter key opens subfolders
    },
  },
})
