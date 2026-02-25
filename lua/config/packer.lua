-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    -- Telescope Fuzy Finder
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        requires = { { "nvim-lua/plenary.nvim" } },
    })

    -- BufferLine
    use({ "akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons" })

    -- File Explorer
    use({
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
    })

    -- Tresitter Highlighting
    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

    -- Treesitter Playground
    use("nvim-treesitter/playground")

    -- LSP and Completion
    use({
        "neovim/nvim-lspconfig",
        requires = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-vsnip",
            "hrsh7th/vim-vsnip",
        },
    })

    -- Formating
    use({
        "nvimtools/none-ls.nvim",
        requires = {
            "jay-babu/mason-null-ls.nvim",
        },
    })

    -- LazyGit
    use({
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        requires = {
            "nvim-lua/plenary.nvim",
        },
    })

    -- Git Signs
    use("lewis6991/gitsigns.nvim")

    -- GitHub Copilot
    -- use("github/copilot.vim")

    -- Undo Tree
    use("mbbill/undotree")

    -- Leap
    use {'https://codeberg.org/andyg/leap.nvim'}

    -- Surround Nvim
    use("tpope/vim-surround")

    -- Status Line
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "nvim-tree/nvim-web-devicons", opt = true },
    })

    -- Diagnostic Dashbord
    use("folke/trouble.nvim")

    -- Duck
    use({ "tamton-aquib/duck.nvim" })

    -- Vim Tmux Navigator
    use("christoomey/vim-tmux-navigator")

    -- Colorschemes
    use("f-person/auto-dark-mode.nvim")
    use({ "sainnhe/gruvbox-material", as = "gruvbox-material" })
    use({ "ellisonleao/gruvbox.nvim", as = "gruvbox" })
    use({ "sainnhe/everforest", as = "everforest" })
end)
