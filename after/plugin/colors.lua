local available_colorschemes = {
    "rose-pine",
    "gruvbox-material",
    "gruvbox",
}

-- Default color scheme
local default_colorscheme = "gruvbox"
vim.cmd.colorscheme(default_colorscheme)

local function applyColorScheme(color)
    color = color or default_colorscheme
    vim.cmd.colorscheme(color)
end

-- Prompt available colorschemes
local function promptColorschemes()
    local prompt_string = "Choose a colorscheme:\n"
    for i, scheme in ipairs(available_colorschemes) do
        prompt_string = prompt_string .. i .. ". " .. scheme .. "\n"
    end

    vim.ui.input({
        prompt = prompt_string,
        completion = "menu",
    }, function(input)
        local index = tonumber(input)
        if index and available_colorschemes[index] then
            applyColorScheme(available_colorschemes[index])
        else
            applyColorScheme()
        end
    end)
end

vim.keymap.set("n", "<leader>cs", promptColorschemes, { desc = "Choose colorscheme" })
