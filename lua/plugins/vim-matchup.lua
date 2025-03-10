return {
  'andymass/vim-matchup',
  enabled = true,
  event = "VeryLazy",
  config = function()
    -- may set any options here
    vim.g.matchup_matchparen_offscreen = { method = "popup" }
    vim.g.loaded_matchit = 1
    -- vim.g.matchup_surround_enabled = 1
  end,
}
