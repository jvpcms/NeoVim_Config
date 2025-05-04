-- Default color scheme
local default_colorscheme = "gruvbox"
vim.cmd.colorscheme(default_colorscheme)

function ApplyColorScheme(color)
    color = color or default_colorscheme
    vim.cmd.colorscheme(color)
end
