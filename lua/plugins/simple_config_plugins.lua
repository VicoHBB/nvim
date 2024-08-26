return {
  {                                                              -- Vim Be Good
    'ThePrimeagen/vim-be-good',
    -- event = "VeryLazy",
    cmd = "VimBeGood"
  },
  {
    "kylechui/nvim-surround",
    version = "*",   -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  "junegunn/vim-easy-align", -- Easy align
  {                          -- Table Mode
    'dhruvasagar/vim-table-mode',
    ft = {
      "markdown",
      "org"
    },
    config = function()
      vim.g.table_mode_map_prefix = '|'
    end,
  },
  { -- Virtual column
    "xiyaowong/virtcolumn.nvim",
    config = function()
      vim.g.virtcolumn_char = '▕' -- char to display the line
      vim.g.virtcolumn_priority = 10 -- priority of extmark
    end
  },
  { -- Vim-matchup
    'andymass/vim-matchup',
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
  {
    'Wansmer/treesj',
    event = "VeryLazy",
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('treesj').setup({
        use_default_keymaps = false,
      })
    end,
  },
  {
    "terrastruct/d2-vim",    -- D2
    ft = {
      'd2'
    }
  },
  -- To probe
}
