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
            "systemverilog", -- This does not work properly; manage on ftplugin/
            "toml",
            -- "verilog", -- This does not work properly; manage on ftplugin/
            "vim",
            "vimdoc",
            "zsh"
        },
    },
    config = function(_, opts)
        local TS = require('nvim-treesitter')

        TS.install(opts.languages)

        vim.treesitter.language.register('systemverilog',{'verilog'})

        vim.api.nvim_create_autocmd('FileType', {
            group = vim.api.nvim_create_augroup('treesitter.setup', {}),
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
            desc = "Select Inner Loop",
        },
        {
            "<leader>sp",
            function()
                require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.inner")
            end,
            mode = { 'n' },
            silent = true,
            desc = "Select Inner Loop",
        },
    }
}
