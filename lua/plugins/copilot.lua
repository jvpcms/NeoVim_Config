return {
  -- Copilot Lua Plugin
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = "<M-p>",
            accept_word = "<M-l>",
            accept_line = "<M-o>",
            next = "<M-j>",
            prev = "<M-k>",
            dismiss = "<M-h>",
          },
        },
        panel = { enabled = true },
      })
    end,
  },
  -- Copilot CMP Plugin
  -- {
  --   "zbirenbaum/copilot-cmp",
  --   after = { "copilot.lua" },
  --   config = function()
  --     require("copilot_cmp").setup()
  --   end,
  -- },
}
