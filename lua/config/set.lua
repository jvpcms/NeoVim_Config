-- Editor configs and sets

-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

-- Indent
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

-- Line wrap
vim.opt.wrap = true
vim.opt.textwidth = 80

-- Vim backup disable, but undotree access to older versions
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Search highlighting and incremental search
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Better colors
vim.opt.termguicolors = true

-- Scolloff at botton of screen, include @-@ in filenames
vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")

-- Update time
vim.opt.updatetime = 50

-- Color column at 80
vim.opt.colorcolumn = "80"

-- Leader key
vim.g.mapleader = " "
