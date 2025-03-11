return {
  "catppuccin/nvim",
  enabled = false,
  name = "catppuccin",
  priority = 1000,
  config = function()
    -- [[ Set colorscheme ]]
    vim.cmd.colorscheme "catppuccin-mocha"
  end
}
