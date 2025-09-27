return {
    'lewis6991/gitsigns.nvim',
    enabled = true,
    event = "VeryLazy",
    opts = {
        signs = {
            add          = { text = '+' },
            change       = { text = '!' },
            delete       = { text = '_' },
            topdelete    = { text = '‾' },
            changedelete = { text = '~' },
            untracked    = { text = '┆' },
        },
        signs_staged = {
            add          = { text = '┃' },
            change       = { text = '┃' },
            delete       = { text = '_' },
            topdelete    = { text = '‾' },
            changedelete = { text = '~' },
            untracked    = { text = '┆' },
        },
    },
    keys = {
        {
            "<leader>hs",
            function()
                require('gitsigns').stage_hunk()
            end,
            mode = { "n" },
            desc = "Git Toggle Stage Hunk",
        },
        {
            "<leader>hs",
            function()
                local gitsigns = require('gitsigns')
                require('gitsigns').stage_hunk()
                gitsigns.stage_hunk({
                    vim.fn.line('.'),
                    vim.fn.line('v')
                })
            end,
            mode = { "v" },
            desc = "Git Toggle Stage Hunk",
        },
        {
            "<leader>hr",
            function()
                require('gitsigns').reset_hunk()
            end,
            mode = { "n" },
            desc = "Git Reset Hunk",
        },
        {
            "<leader>hr",
            function()
                local gitsigns = require('gitsigns')
                gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
            end,
            mode = { "v" },
            desc = "Git Reset Hunk",
        },
        {
            "<leader>hS",
            function()
                require('gitsigns').stage_buffer()
            end,
            mode = { "n" },
            desc = "Git Stage Buffer",
        },
        {
            "<leader>hR",
            function()
                require('gitsigns').reset_buffer()
            end,
            mode = { "n" },
            desc = "Git Reset Buffer",
        },
        {
            "<leader>hp",
            function()
                require('gitsigns').preview_hunk()
            end,
            mode = { "n" },
            desc = "Git Preview Hunk",
        },
        {
            "<leader>hi",
            function()
                require('gitsigns').preview_hunk_inline()
            end,
            mode = { "n" },
            desc = "Git Preview Hunk Inline",
        },
        {
            "<leader>hb",
            function()
                require('gitsigns').blame_line({ full = true })
            end,
            mode = { "n" },
            desc = "Git Hunk Blame line",
        },
        {
            "<leader>hd",
            function()
                require('gitsigns').diffthis()
            end,
            mode = { "n" },
            desc = "Git Diff This Buffer",
        },
        {
            "<leader>hD",
            function()
                require('gitsigns').diffthis("~")
            end,
            mode = { "n" },
            desc = "Git Diff This Selection",
        },
        {
            "<leader>hw",
            function()
                require('gitsigns').toggle_word_diff()
            end,
            mode = { "n" },
            desc = "Hinks Togglw Words Diff",
        },
        {
            "ih",
            function()
                require('gitsigns').select_hunk()
            end,
            mode = { "o",  "x" },
            desc = "Select Inner Hunk",
        },
        {
            "[c",
            function()
                if vim.wo.diff then
                    vim.cmd.normal({ '[c', bang = true })
                else
                    require('gitsigns').nav_hunk('prev')
                end
            end,
            mode = { "n" },
            desc = "Git Previous Hunk",
        },
        {
            "]c",
            function()
                if vim.wo.diff then
                    vim.cmd.normal({ ']c', bang = true })
                else
                    require('gitsigns').nav_hunk('next')
                end
            end,
            mode = { "n" },
            desc = "Git Next Hunk",
        },
    }
}
