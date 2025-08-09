return {
    'echasnovski/mini.nvim',
    enabled = true,
    -- lazy = true,
    event = "VeryLazy",
    version = '*',
    config = function()
        -- require('mini.icons').setup()
        -- require('mini.ai').setup()
        -- require('mini.animate').setup()
        require('mini.files').setup()
        require('mini.sessions').setup()
        require('mini.pairs').setup()
        require('mini.files').setup({
            mappings = {
                synchronize = '<leader>w',
            }
        })
        require('mini.comment').setup({
            mappings = {
                comment = '<leader>c',
                comment_line = '<leader>cc',
                comment_visual = '<leader>c',
                textobject = '<leader>c',
            },
        })
        require('mini.operators').setup({
            replace = {
                prefix = '<leader>mr',
            },
            exchange = {
                prefix = '<leader>e',
            },
            sort = {
                prefix = '<leader>s',
            },
        })

        require('mini.align').setup({
            mappings = {
                start = 'ga',
                start_with_preview = '<leader>gA',
            },
        })

        require('mini.splitjoin').setup({
            mappings = {
                toggle = '<leader>st',
            },
        })

        require('mini.surround').setup({
            mappings = {
                add = 'ys',                    -- Add surrounding in Normal and Visual modes
                delete = 'ds',                 -- Delete surrounding
                find = '<leader>fs',           -- Find surrounding (to the right)
                find_left = '<leader>fS',      -- Find surrounding (to the left)
                highlight = '<leader>ys',      -- Highlight surrounding
                replace = 'cs',                -- Replace surrounding
                update_n_lines = '<leader>yn', -- Update `n_lines`
                suffix_last = 'L',             -- Suffix to search with "prev" method
                suffix_next = 'N',             -- Suffix to search with "next" method
            },
        })
    end,
    keys = {
        {
            "<leader>mf",
            function()
                MiniFiles.open()
            end,
            mode = { "n" },
            silent = true,
            desc = "Open MiniFiles"
        },
        {
            "<leader>rs",
            function()
                MiniSessions.read()
            end,
            mode = { "n" },
            silent = true,
            desc = "Read session"
        },
        -- @TODO: Check how to set with MiniPairs.map_buf
        {
            "/*",
            "/* */<Left><Left><Left>",
            mode = { "i" },
            ft = { 'c', 'cpp', 'verilog', 'systemverilog' },
            silent = true,
            desc = "C/C++ Block Comment"
        },
        {
            "/*<CR>",
            "/*<CR>*<CR>*/<Esc>kA<Space>",
            mode = { "i" },
            ft = { 'c', 'cpp', 'verilog', 'systemverilog' },
            silent = true,
            desc = "C/C++ Block Comment"
        },
    }
}
