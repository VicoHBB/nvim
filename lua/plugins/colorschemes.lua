return {
  {
    "morhetz/gruvbox",
    priority = 1000,
    lazy = false,
    config = function()
      vim.g.gruvbox_contrast_dark = "hard"
      -- vim.cmd.colorscheme "gruvbox"
    end,
  },
  {
    'sainnhe/gruvbox-material',
    config = function()
      vim.g.gruvbox_material_foreground = "original"
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
      vim.g.gruvbox_material_statusline_style = "original"
      vim.g.gruvbox_material_diagnostic_text_highlight = 1
      vim.cmd.colorscheme "gruvbox-material"
    end,
  },
  -- {
    -- 'luisiacc/gruvbox-baby',
    -- priority = 1000,
    -- lazy = false,
    -- branch = "main",
    -- config = function ()
    --   -- vim.cmd.colorscheme "gruvbox-baby"
    --   vim.g.gruvbox_baby_function_style = "NONE"
    --   vim.g.gruvbox_baby_keyword_style = "italic"
    --   -- vim.g.gruvbox_baby_highlights = {Normal = {fg = "#123123", bg = "NONE", style="underline"}}
    --   vim.g.gruvbox_baby_telescope_theme = 1
    --   vim.g.gruvbox_baby_transparent_mode = 0
    --   vim.g.background_color = "dark"
    -- end
  -- },
  -- {
    -- "catppuccin/nvim",
    -- name = "catppuccin",
    -- priority = 1000,
  -- },
}
