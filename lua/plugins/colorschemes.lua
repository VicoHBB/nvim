return {
  {
    "morhetz/gruvbox",
    priority = 1000,
    lazy = false,
    config = function()
      vim.g.gruvbox_contrast_dark = "hard"
      vim.cmd.colorscheme "gruvbox"
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
--    priority = 1000,
    lazy = false,
--  config = function()
--    vim.cmd.colorscheme "catppuccin-mocha"
--  end,
  },
}
