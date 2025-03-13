return {
    "nvim-treesitter/nvim-treesitter",
    enabled = true,
    build = ":TSUpdate",
    event = "VeryLazy",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        -- "nfrid/treesitter-utils",  -- Maybe use latter
    },
    config = function()
        local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

        require('nvim-treesitter.configs').setup({
            -- A list of parser names, or "all"
            ensure_installed = {
                "asm",
                "bash",
                "c",
                "cmake",
                "cpp",
                "diff",
                "gitignore",
                "json",
                "latex", -- need tree-sitter client install
                "lua",
                "toml",
                "make",
                "markdown",
                "markdown_inline",
                "mermaid",
                -- "org",
                "python",
                "regex",
                "rust",
                "verilog",
                "vim",
                -- "systemverilog"
                "css",
                "html",
                "javascript",
                "norg",
                "scss",
                "svelte",
                "typst",
                "vue",
                "tsx",
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
                    "cmake",
                    "verilog",
                    "systemverilog"
                    -- "org"
                },
                -- additional_vim_regex_highlighting = true,
            },
            indent = {
                enable = true,
            },

            fold = {
                enable = true,
            },

            matchup = {
                enable = true, -- mandatory, false will disable the whole extension
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
}

