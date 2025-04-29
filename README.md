# jvpcms Neovim Config

A few months ago, I decided to switch from traditional IDEs and started exploring Vim distributions.  
I tried LazyVim, and for a while, it was my main editor.  
I fell in love with Vim, but the abundance of features I didn't need eventually started to bother me.  
So, I decided to create my own configuration and switched to vanilla Neovim.

## Plugins

All plugins are managed by [Packer](https://github.com/wbthomason/packer.nvim).

### File Finding and Navigation

**[Telescope](https://github.com/nvim-telescope/telescope.nvim):**  
Fuzzy file finder, grep tool, and more

```lua
use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    requires = { {'nvim-lua/plenary.nvim'} }
}
```

**[Harpoon](https://ThePrimeagen/harpoon):**    
Mark files and quickly navigate to them

```lua
use {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    requires = { {'nvim-lua/plenary.nvim'} }
}
```

### Syntax Highlighting and Code Completion

**[Treesitter](https://github.com/nvim-treesitter/nvim-treesitter):**   
Syntax highlighting and code folding

```lua
use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
```

**[LSPConfig](https://github.com/neovim/nvim-lspconfig):**  
Language Server Protocol configuration for Neovim

**[Mason](https://github.com/williamboman/mason.nvim):**    
Package manager for LSP servers, DAP servers, linters, and formatters

**[NvimCMP](https://github.com/hrsh7th/nvim-cmp):**   
Completion engine for Neovim

```lua
    use {
        "neovim/nvim-lspconfig",
        requires = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip'
        },
    }
```
### Git Integration
**[LazyGit](https://github.com/kdheepak/lazygit.nvim):**    
Provides a powerfull UI for git operations (Got used to it in LazyVim 😄)

```lua
    use({
        "kdheepak/lazygit.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        },
    })
```

**[Gitsigns](https://github.com/lewis6991/gitsigns.nvim):**   
Indicate added, changed, deleted lines in the gutter

```lua
    use({
        "lewis6991/gitsigns.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        },
    })
```

### AI Suggestions
**[Copilot](https://github.com/github/copilot.vim):**   
GitHub Copilot integration for Neovim

```lua
    use({"github/copilot.vim"})
```

### Better Dev Experience
**[Undotree](https://github.com/mbbill/undotree):**   
Visualize and navigate the past undo history of a file

```lua
use('mbbill/undotree')
```

**[Leap](https://github.com/ggandor/leap.nvim):**   
Easily jump to any location on the visible area

```lua
use("ggandor/leap.nvim")
```

**[VimSurround ](https://github.com/tpope/vim-surround):**  
Surround text with quotes, brackets, etc

```lua
use("tpope/vim-surround")
```

## Keybindings
Here are some of the keybindings I find most useful:
