return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = 'main',
    build = ":TSUpdate",
    dependencies = {
        {
            "nvim-treesitter/nvim-treesitter-textobjects",
            branch = 'main'
        }
        -- "nfrid/treesitter-utils",  -- Maybe use latter
    },
    opts = {
        languages = {
            "asm",
            "bash",
            "c",
            "cmake",
            "cpp",
            "diff",
            "gitignore",
            "gitcommit",
            "json",
            "latex",
            "lua",
            "make",
            "markdown",
            "markdown_inline",
            "mermaid",
            "python",
            "regex",
            "rust",
            "systemverilog",
            "toml",
            "tmux",
            "vim",
            "vimdoc",
            "zsh"
        },
    },
    config = function(_, opts)
        local autocmd = vim.api.nvim_create_autocmd
        local ts_group = vim.api.nvim_create_augroup("treesitter_autocmds", { clear = true })
        local TS = require('nvim-treesitter')

        -- tmux was dropped from the upstream parser registry; register it as
        -- an unlisted parser. Must run before TS.install(), which reloads
        -- the registry (firing this same event) before validating languages.
        autocmd('User', {
            group = ts_group,
            pattern = 'TSUpdate',
            callback = function()
                require('nvim-treesitter.parsers').tmux = {
                    install_info = {
                        url = 'https://github.com/Freed-Wu/tree-sitter-tmux',
                        branch = 'release',
                        revision = '534b7cbc6d2d23504b1ea0accb886d8a6cf93906',
                        queries = 'queries',
                    },
                    tier = 2,
                }
            end,
        })

        TS.install(opts.languages)

        vim.treesitter.language.register('systemverilog',{'verilog', 'sv', 'v'})

        -- tmux config is split across files under dotfiles/tmux/ that don't start
        -- with "tmux" in the name, so Neovim's built-in ftdetect falls back to the
        -- generic "conf" filetype (shared with picom.conf & friends). Scope the
        -- override to the path instead of registering 'conf' -> tmux globally.
        vim.filetype.add({
            pattern = {
                ['.*/dotfiles/tmux/.*%.conf'] = 'tmux',
            },
        })

        autocmd('FileType', {
            group = ts_group,
            callback = function(args)
                local buf = args.buf
                local filetype = args.match
                -- you need some mechanism to avoid running on buffers that do not
                -- correspond to a language (like oil.nvim buffers), this implementation
                -- checks if a parser exists for the current language
                local language = vim.treesitter.language.get_lang(filetype) or filetype
                if not vim.treesitter.language.add(language) then
                    return
                end

                if filetype == "verilog" or filetype == "systemverilog" then
                    vim.bo[buf].syntax = filetype
                    vim.bo[buf].indentexpr = "GetVerilogIndent()"
                    vim.wo.foldmethod = 'expr'
                    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
                else
                    -- replicate `highlight = { enable = true }`
                    vim.treesitter.start(buf, language)
                    -- replicate `indent = { enable = true }`
                    vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                    -- replicate `fold = { enable = true }`
                    vim.wo.foldmethod = 'expr'
                    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
                end
                vim.wo.foldlevel = 99

            end,
        })

    end,
    keys = {
        {
            "af",
            function()
                require("nvim-treesitter-textobjects.select").select_textobject(
                    "@function.outer",
                    "textobjects"
                )
            end,
            mode = { 'x', 'o' },
            silent = true,
            desc = "Select Outer Function",
        },
        {
            "if",
            function()
                require("nvim-treesitter-textobjects.select").select_textobject(
                    "@function.inner",
                    "textobjects"
                )
            end,
            mode = { 'x', 'o' },
            silent = true,
            desc = "Select Inner Function",
        },
        {
            "ac",
            function()
                require("nvim-treesitter-textobjects.select").select_textobject(
                    "@conditional.outer",
                    "textobjects"
                )
            end,
            mode = { 'x', 'o' },
            silent = true,
            desc = "Select Outer Conditional",
        },
        {
            "ic",
            function()
                require("nvim-treesitter-textobjects.select").select_textobject(
                    "@conditional.inner",
                    "textobjects"
                )
            end,
            mode = { 'x', 'o' },
            silent = true,
            desc = "Select Inner Conditional",
        },
        {
            "al",
            function()
                require("nvim-treesitter-textobjects.select").select_textobject(
                    "@loop.outer",
                    "textobjects"
                )
            end,
            mode = { 'x', 'o' },
            silent = true,
            desc = "Select Outer Loop",
        },
        {
            "il",
            function()
                require("nvim-treesitter-textobjects.select").select_textobject(
                    "@loop.inner",
                    "textobjects"
                )
            end,
            mode = { 'x', 'o' },
            silent = true,
            desc = "Select Inner Loop",
        },
        {
            "<leader>sn",
            function()
                require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner")
            end,
            mode = { 'n' },
            silent = true,
            desc = "Swap Next Parameter",
        },
        {
            "<leader>sp",
            function()
                require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.inner")
            end,
            mode = { 'n' },
            silent = true,
            desc = "Swap Previous Parameter",
        },
    }
}
