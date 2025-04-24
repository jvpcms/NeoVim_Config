-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Telescope Fuzy Finder
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- Gruvbox Material Colorscheme
	use({
		'sainnhe/gruvbox-material',
		as = 'gruvbox-material',
		config = function()
			vim.cmd('colorscheme gruvbox-material' )
		end
	})

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

end)
