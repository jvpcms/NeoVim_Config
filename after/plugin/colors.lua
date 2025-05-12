local auto_dark_mode = require("auto-dark-mode")

local available_colorschemes = {
    "rose-pine",
    "gruvbox-material",
    "gruvbox",
    "everforest",
}

-- Default color scheme
local default_colorscheme = "gruvbox"

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

vim.keymap.set("n", "<leader>cc", promptColorschemes, { desc = "Choose colorscheme" })

-- Auto Dark Mode
auto_dark_mode.setup({
    set_dark_mode = function()
        vim.cmd.colorscheme("gruvbox")
        vim.api.nvim_set_option_value("background", "dark", {})
    end,
    set_light_mode = function()
        vim.cmd.colorscheme("everforest")
        vim.api.nvim_set_option_value("background", "light", {})
    end,
    update_interval = 3000,
    fallback = "dark",
})
