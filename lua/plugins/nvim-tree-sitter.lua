return {
  {                                                               -- Nvim treesitter
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
		-- event = "VeryLazy",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "pleshevskiy/tree-sitter-d2",
      "HiPhish/nvim-ts-rainbow2",
      "andymass/vim-matchup",
      "nfrid/treesitter-utils",
		},
    config = function()
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      require('nvim-treesitter.configs').setup ({
      -- A list of parser names, or "all"
        ensure_installed = {
          "c",
          "cpp",
          "lua",
          "rust",
          "python",
          "vim",
          "verilog",
          "latex",
          "markdown",
          "make",
          "cmake",
          "bash",
          "gitignore",
          "org"
        },

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
            "make"
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

        rainbow = {
          enable = false,
          -- list of languages you want to disable the plugin for
          -- disable = { 'jsx', 'cpp' },
          -- Which query to use for finding delimiters
          query = 'rainbow-parens',
          -- Highlight the entire buffer all at once
          strategy = require('ts-rainbow').strategy.global,
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
              ["al"] = "@loop.outer",
              ["il"] = "@loop.inner",
            }
          }
        }

      })

      parser_config.sv = ({
        install_info = {
          url = "/home/vhbb/Repos/tree-sitter/tree-sitter-sv", -- local path or git repo
          -- url = "https://github.com/rfdonnelly/tree-sitter-sv",
          files = {"src/parser.c"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
          -- optional entries:
          branch = "main", -- default branch in case of git repo if different from master
          generate_requires_npm = true, -- if stand-alone parser without npm dependencies
          requires_generate_from_grammar = true, -- if folder contains pre-generated src/parser.c
        },
        filetype = "systemverilog", -- if filetype does not match the parser name
      })

  -- parser_config.verilog = {
  --   filetype = {
  --     "verilog",
  --     "systemverilog",
  --   }, -- if filetype does not match the parser name
  -- }

			parser_config.d2 = ({
				{
				install_info = {
					url = 'https://github.com/pleshevskiy/tree-sitter-d2',
					revision = 'main',
					files = { 'src/parser.c', 'src/scanner.cc' },
				},
				filetype = 'd2',
				}
			})


    end,
  },
}

