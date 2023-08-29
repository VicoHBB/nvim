return {
  "ryanoasis/vim-devicons",                                       -- Vim devicons
  "terryma/vim-multiple-cursors",                                 -- Multiple cursors
  "mhinz/vim-signify",                                            -- Vim signify
  {
    "airblade/vim-rooter",                                        -- Vim Rooter
    config = function()
      -- Vim-rooter
      vim.g.rooter_patterns = { '.git', 'makefile', 'compile_commands.json' }
      vim.g.rooter_change_directory_for_non_project_files = 'current'
    end,
  },
  {                                                               -- Syntax
    "sheerun/vim-polyglot",
    priority = 1000,
    lazy = false,
  },
  -- "tpope/vim-surround",                                           -- Vim surround
  {
      "kylechui/nvim-surround",
      version = "*", -- Use for stability; omit to use `main` branch for the latest features
      event = "VeryLazy",
      config = function()
          require("nvim-surround").setup({
              -- Configuration here, or leave empty to use defaults
          })
      end
  },
  "junegunn/vim-easy-align",                                      -- Easy align
  "preservim/tagbar",                                             -- Tagbar
  {                                                               -- Local History
    "dinhhuy258/vim-local-history",
    branch = "master",
    build = ":UpdateRemotePlugins"
  },
  {                                                               -- HOP
    "phaazon/hop.nvim",
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require('hop').setup { keys = 'etovxqpdygfblzhckisuran' }
    end,
  },
  {
    "mistweaverco/Screenshot.nvim",
  },
  "SmiteshP/nvim-navic",
  {
    "skywind3000/asyncrun.vim",                                   -- Asyncrn
    config = function()
      vim.g.asyncrun_open = 8
    end,
  },
  {                                                               -- Harpon
    "ThePrimeagen/harpoon",
    config = function()
      require("harpoon").setup({
          menu = {
              width = vim.api.nvim_win_get_width(0) - 4,
          }
      })
    end,
  },
  {                                                               -- Virtual column
    "xiyaowong/virtcolumn.nvim",
    lazy = false,
    config = function ()
      vim.g.virtcolumn_char = '▕' -- char to display the line
      vim.g.virtcolumn_priority = 10 -- priority of extmark
    end
  },
  {                                                               -- Vim-matchup
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
    dependencies = {
      "glts/vim-magnum",
      "tpope/vim-repeat",
    },
    event = "VeryLazy",
  },
  {
    'nacro90/numb.nvim',
    config = function ()
      require('numb').setup{
        show_numbers         = true, -- Enable 'number' for the window while peeking
        show_cursorline      = true, -- Enable 'cursorline' for the window while peeking
        hide_relativenumbers = true, -- Enable turning off 'relativenumber' for the window while peeking
        number_only          = false, -- Peek only when the command is only a number instead of when it starts with a number
        centered_peeking     = true, -- Peeked line will be centered relative to window
      }
    end
  },
  {
    'Wansmer/treesj',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('treesj').setup({
           use_default_keymaps = false,
      })
    end,
  },
  -- To probe
  {
    "eandrju/cellular-automaton.nvim",
    event = "VeryLazy",
  },
}
