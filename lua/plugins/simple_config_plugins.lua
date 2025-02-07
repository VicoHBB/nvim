return {
  {                                                              -- Vim Be Good
    enabled = false,
    'ThePrimeagen/vim-be-good',
    -- event = "VeryLazy",
    cmd = "VimBeGood"
  },
  -- "junegunn/vim-easy-align", -- Easy align
  { -- Virtual column
    "xiyaowong/virtcolumn.nvim",
    config = function()
      vim.g.virtcolumn_char = '▕' -- char to display the line
      vim.g.virtcolumn_priority = 10 -- priority of extmark
    end
  },
  { -- Vim-matchup
    'andymass/vim-matchup',
    event = "VeryLazy",
    config = function()
      -- may set any options here
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
      vim.g.loaded_matchit = 1
      -- vim.g.matchup_surround_enabled = 1
    end
  },
  {
    "glts/vim-radical",
    event = "VeryLazy",
    dependencies = {
      "glts/vim-magnum",
      "tpope/vim-repeat",
    },
  },
}
