-- Default color scheme
vim.cmd('colorscheme gruvbox-material' )

function ApplyColorScheme(color)
	color = color or "gruvbox-material"
	vim.cmd.colorscheme(color)
end

