-- Completions dropdown
return {
  "hrsh7th/nvim-cmp",
  config = function()
    local cmp = require("cmp")
    cmp.setup({
      mapping = {
        -- Accept the currently selected item
        ["<Tab>"] = cmp.mapping.confirm({ select = true }),

        -- Navigate through the suggestions
        ["{"] = cmp.mapping.select_prev_item(),
        ["}"] = cmp.mapping.select_next_item(),

        -- Esc to dismiss completion menu, and exit insert mode only if menu is not visible
        ["<Esc>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.close()
          else
            fallback()
          end
        end, { "i", "s" }),
      },
      sources = {
        -- { name = "copilot", group_index = 3 }, -- For copilot suggestions in cmp
        { name = "nvim_lsp", group_index = 2 },
        { name = "path", group_index = 2 },
        { name = "luasnip", group_index = 2 },
      },
    })
  end,
}
