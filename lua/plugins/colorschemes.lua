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
    'sainnhe/gruvbox-material',
  },
  {
    'luisiacc/gruvbox-baby',
    priority = 1000,
    lazy = false,
    branch = "main",
    config = function ()
      -- vim.cmd.colorscheme "gruvbox-baby"
      vim.g.gruvbox_baby_function_style = "NONE"
      vim.g.gruvbox_baby_keyword_style = "italic"
      -- vim.g.gruvbox_baby_highlights = {Normal = {fg = "#123123", bg = "NONE", style="underline"}}
      vim.g.gruvbox_baby_telescope_theme = 1
      vim.g.gruvbox_baby_transparent_mode = 1
    end
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
