local lualine = require("lualine")
local treesitter_utils = require("nvim-treesitter.ts_utils")

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

local typePatternsSymbols = {
    [" f"] = { "function_declaration", "function_definition", "method_definition" },
    [" f(x)"] = { "function_call", "call", "call_expression" },
    [" ⊟"] = { "class_definition", "class_declaration" },
    [" ⚯"] = { "interface_declaration" },
}

local fieldsWithIdentifiers = {
    "name",
    "function",
}

local function prettyNodeIndication(node)
    local nodeType = node:type()
    local nodeIdientifier = nil

    for _, field in ipairs(fieldsWithIdentifiers) do
        local fieldNode = node:field(field)
        if fieldNode and #fieldNode > 0 then
            nodeIdientifier = fieldNode[1]
            break
        end
    end

    if nodeIdientifier then
        local nodeTypeSymbol = ""

        for symbol, patterns in pairs(typePatternsSymbols) do
            for _, pattern in ipairs(patterns) do
                if nodeType == pattern then
                    nodeTypeSymbol = symbol
                    break
                end
            end
        end

        local nodeNameText = vim.treesitter.get_node_text(nodeIdientifier, 0)
        return " ➔" .. nodeTypeSymbol .. " " .. nodeNameText
    else
        return ""
    end
end

local function getNodeNameSequence(node, depth)
    local startNode = node

    if depth == 0 then
        startNode = treesitter_utils.get_node_at_cursor()
    end

    if startNode then
        local parent = startNode:parent()
        return getNodeNameSequence(parent, depth + 1) .. prettyNodeIndication(startNode)
    else
        return ""
    end
end

local function statusSection()
    return getNodeNameSequence(nil, 0)
end

local statuslineCustomSection = {
    {
        getPathIndicator,
        color = { fg = "#82A598" },
    },
    {
        statusSection,
        color = { fg = "#8EC07C" },
    },
}

lualine.setup({
    options = {
        theme = "gruvbox",
        icons_enabled = true,
        globalstatus = true,
        component_separators = { left = "", right = "" },
    },
    sections = {
        lualine_c = statuslineCustomSection,
    },
})
