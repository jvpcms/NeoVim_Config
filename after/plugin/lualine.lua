local lualine = require("lualine")
local treesitter = require("nvim-treesitter")

local function getRelativePath()
    return vim.fn.expand("%:.")
end

local function getPathIndicator()
    local folderIcon = ""
    local fileIcon = ""

    local path = getRelativePath()
    local pathParts = vim.split(path, "/")

    local pathIndicator = ""

    for i, part in ipairs(pathParts) do
        if i == #pathParts then
            pathIndicator = pathIndicator .. fileIcon .. " " .. part
        else
            pathIndicator = pathIndicator .. folderIcon .. " " .. part .. " / "
        end
    end

    return pathIndicator
end

local function cursorInterface()
    return treesitter.statusline({
        type_patterns = { "interface_declaration" },
    })
end

local function cursorCurrentClass()
    return treesitter.statusline({
        type_patterns = { "class" },
    })
end

local function cursorCurrentFunction()
    return treesitter.statusline({
        type_patterns = { "function" },
    })
end

local function cursorCurrentMethod()
    return treesitter.statusline({
        type_patterns = { "method" },
    })
end

local function cursorCurrentInformation()
    local interface = cursorInterface()
    local class = cursorCurrentClass()
    local functionName = cursorCurrentFunction()
    local method = cursorCurrentMethod()

    local indication = ""

    if interface ~= "" then
        indication = indication .. " ➔ ⚯ " .. interface
    end
    if class ~= "" then
        indication = indication .. " ➔ ⊟ " .. class
    end
    if functionName ~= "" then
        indication = indication .. " ➔ fx " .. functionName
    end
    if method ~= "" then
        indication = indication .. " ➔ fx " .. method
    end

    return indication
end

local function statuslineCustomSection()
    return getPathIndicator() .. " " .. cursorCurrentInformation()
end

lualine.setup({
    options = {
        theme = "gruvbox",
        icons_enabled = true,
        globalstatus = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
    },
    sections = {
        lualine_c = { statuslineCustomSection },
    },
})
