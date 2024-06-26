return {
  "terryma/vim-multiple-cursors",                                 -- Multiple cursors
  "mhinz/vim-signify",                                            -- Vim signify
  {
    'notjedi/nvim-rooter.lua',                                    -- Nvim roter
    config = function() require'nvim-rooter'.setup({
        rooter_patterns = {
          '.git',
          'makefile',
          'Makefile',
          'app',
          'compile_commands.json',
          'References',
        },
        trigger_patterns = { '*' },
        manual = false,
        fallback_to_parent = false,
      })
    end
  },
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
  {                                                               -- Table Mode
    'dhruvasagar/vim-table-mode',
    ft = {
      "markdown",
      "org"
    },
    config = function()
      vim.g.table_mode_map_prefix = '|'
    end,
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
  {
    "skywind3000/asyncrun.vim",                                   -- Asyncrn
    config = function()
      vim.g.asyncrun_open = 8
    end,
  },
  {                                                           -- Virtual column
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
  'rush-rs/tree-sitter-asm',    --ASM
  -- To probe
}
