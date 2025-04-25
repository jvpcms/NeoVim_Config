-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Telescope Fuzy Finder
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

    -- Colorschemes
    use({ 'rose-pine/neovim', as = 'rose-pine' })
	use({ 'sainnhe/gruvbox-material', as = 'gruvbox-material' })

	-- Tresitter Highlighting
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

	-- Harpoon File Navigation
	use {
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { {"nvim-lua/plenary.nvim"} }
	}

	-- Undo Tree
	use('mbbill/undotree')

	-- LazyGit
	use({
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

    -- Git Signs
    use ('lewis6991/gitsigns.nvim')

    -- Leap
    use("ggandor/leap.nvim")

    -- GitHub Copilot
    use("github/copilot.vim")
end)
