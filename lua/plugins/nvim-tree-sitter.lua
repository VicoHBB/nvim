return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = 'main',
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = 'main'
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
            -- "systemverilog",
            "toml",
            -- "verilog",
            "vim",
            "vimdoc",
            "zsh"
        },
    },
    config = function(_, opts)
        local TS = require('nvim-treesitter')

        -- Install parsers from custom ensured_install opt
        if opts.languages and #opts.languages > 0 then
            TS.install(opts.languages)
            -- register and start parsers for ft
            for _, parser in ipairs(opts.languages) do
                vim.treesitter.language.register(parser, parser)
            end
            vim.api.nvim_create_autocmd('FileType', {
                group = vim.api.nvim_create_augroup("TreeSitterLazyLoader", { clear = true }),
                pattern = opts.languages,
                callback = function(event)
                    -- if event.match == "verilog" or event.match == "systemverilog" then
                    --     -- vim.treesitter.start(event.buf, "systemverilog")
                    -- else
                    --     vim.treesitter.start(event.buf, event.match)
                    --     vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                    -- end
                    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
                    vim.treesitter.start(event.buf, event.match)
                    vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })
        end

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
