return {
  'sainnhe/gruvbox-material',
  enabled = true,
  priority = 1000,
  config = function()
    vim.g.gruvbox_material_background = "hard"
    vim.g.gruvbox_material_foreground = "original"
    vim.g.gruvbox_material_enable_bold = 1
    vim.g.gruvbox_material_enable_italic = 1
    vim.g.gruvbox_material_dim_inactive_windows = 1
    vim.g.gruvbox_material_show_eob = 0
    vim.g.gruvbox_material_visual = "green background"
    vim.g.gruvbox_material_menu_selection_background = "green"
    -- vim.g.gruvbox_material_sign_column_background = 'none'
    -- vim.g.gruvbox_material_spell_foreground = "none"
    -- vim.g.gruvbox_material_ui_contrast = "high"
    vim.g.gruvbox_material_float_style = "dim"
    vim.g.gruvbox_material_diagnostic_text_highlight = 1
    vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
    vim.g.gruvbox_material_current_word = "bold"
    vim.g.gruvbox_material_inlay_hints_background = "dimed"
    vim.g.gruvbox_material_statusline_style = "original"
    vim.g.gruvbox_material_better_performance = 1
    vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
    vim.g.gruvbox_material_diagnostic_text_highlight = 1

    -- [[ Set colorscheme ]]
    vim.cmd.colorscheme "gruvbox-material"
  end,
}
