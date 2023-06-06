return {
  "ryanoasis/vim-devicons",                                       -- Vim devicons
  "terryma/vim-multiple-cursors",                                 -- Multiple cursors
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
  "tpope/vim-surround",                                           -- Vim surround
  "junegunn/vim-easy-align",                                      -- Easy align
  "shirk/vim-gas",                                                -- ASM
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
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end,
  },
  "mistweaverco/Screenshot.nvim",
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
    end
  },
  "eandrju/cellular-automaton.nvim",

}
