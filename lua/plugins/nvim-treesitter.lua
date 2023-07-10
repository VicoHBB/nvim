return {
  {                                                               -- Nvim treesitter
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
		dependencies = {
			"HiPhish/nvim-ts-rainbow2",
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
					"bash",
					"gitignore",
				},

				-- Install parsers synchronously (only applied to `ensure_installed`)
				sync_install = false,

				-- List of parsers to ignore installing (for "all")
				-- ignore_install = { "javascript" },

				highlight = {
					-- `false` will disable the whole extension
					enable = true,
					-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
					-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
					-- the name of the parser)
					-- list of language that will be disabled
					-- disable = { "c", "rust" },
					-- disable = { "latex", "make" },
					-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
					-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
					-- Using this option may slow down your editor, and you may see some duplicate highlights.
					-- Instead of true it can also be a list of languages
					additional_vim_regex_highlighting = true,
				},

				matchup = {
					enable = true,              -- mandatory, false will disable the whole extension
					-- disable = { "c", "ruby" },  -- optional, list of language that will be disabled
					-- [options]
				},

    	})

			require('nvim-treesitter.configs').setup {
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
				}
			}


			parser_config.sv = {
				install_info = {
					url = "/home/vhbb/Repos/tree-sitter/tree-sitter-sv", -- local path or git repo
					files = {"src/parser.c"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
					-- optional entries:
					branch = "main", -- default branch in case of git repo if different from master
					generate_requires_npm = true, -- if stand-alone parser without npm dependencies
					requires_generate_from_grammar = true, -- if folder contains pre-generated src/parser.c
				},
				filetype = "verilog_systemverilog ", -- if filetype does not match the parser name
			}

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

