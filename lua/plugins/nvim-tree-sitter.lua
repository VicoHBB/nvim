return {
  {                                                               -- Nvim treesitter
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "VeryLazy",
    dependencies = {
      -- "m-demare/hlargs.nvim",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "andymass/vim-matchup",
      "nfrid/treesitter-utils",
    },
    config = function()
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

      require('nvim-treesitter.configs').setup({
      -- A list of parser names, or "all"
        ensure_installed = {
          "c",
          "cpp",
          "lua",
          "rust",
          "python",
          "vim",
          "verilog",
          -- "systemverilog",
          "asm",
          "json",
          "latex",
          "markdown",
          "markdown_inline",
          "mermaid",
          "regex",
          "make",
          "cmake",
          "bash",
          "gitignore",
          "org"
        },

        ignore_install = {},

        modules = {},

        auto_install = true,

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- List of parsers to ignore installing (for "all")
        -- ignore_install = { "javascript" },

        highlight = {
         -- `false` will disable the whole extension
          enable = true,
          additional_vim_regex_highlighting = { 'org' },
          disable = {
            "latex",
            "make",
            "verilog",
            "systemverilog"
            -- "org"
          },
         -- additional_vim_regex_highlighting = true,
        },
        indent = {
          enable = true,
        },

        matchup = {
          enable = true,              -- mandatory, false will disable the whole extension
          -- disable = { "c", "ruby" },  -- optional, list of language that will be disabled
          -- [options]
          disable_virtual_text = true,
        },

        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@conditional.outer",
              ["ic"] = "@conditional.inner",
              ["aL"] = "@loop.outer",
              ["iL"] = "@loop.inner",
            }
          }
        }

      })

      vim.treesitter.language.register('verilog', 'systemverilog') -- the someft filetype will use the python parser and queries.

      -- @TODO: Check how to install parsers properly
      -- parser_config.systemverilog = {
      --   install_info = {
      --     -- url = "https://github.com/gmlarumbe/tree-sitter-systemverilog",
      --     url = "/home/vico/Repos/parsers/tree-sitter-systemverilog",
      --     files = {"src/parser.c"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
      --     -- optional entries:
      --     branch = "main", -- default branch in case of git repo if different from master
      --     generate_requires_npm = true, -- if stand-alone parser without npm dependencies
      --     requires_generate_from_grammar = true, -- if folder contains pre-generated src/parser.c
      --   },
      --   filetype = "systemverilog", -- if filetype does not match the parser name
      -- }

    end,
  },
}

