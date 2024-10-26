-- Show batery status in neovim
return {
  "justinhj/battery.nvim",
  config = function()
    require("battery").setup()
  end,
}
