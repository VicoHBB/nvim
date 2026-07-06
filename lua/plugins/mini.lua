return {
    'nvim-mini/mini.nvim',
    enabled = true,
    lazy = false,
    -- event = "VeryLazy",
    version = '*',
    config = function()
        local autocmd = vim.api.nvim_create_autocmd
        local mini_group = vim.api.nvim_create_augroup("mini_autocmds", { clear = true })

        -- require('mini.icons').setup()
        -- require('mini.ai').setup()
        -- require('mini.animate').setup()
        -- require('mini.pick').setup()
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
                prefix = '<leader>or',
            },
            exchange = {
                prefix = '<leader>e',
            },
            sort = {
                prefix = '<leader>os',
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

        -- Set MiniPairs for "$" in TeX equations
        autocmd("FileType", {
            group = mini_group,
            pattern = { 'tex', 'markdown', 'org' },
            callback = function()
                MiniPairs.map_buf(0, 'i', '$', { action = 'closeopen', pair = '$$' })
            end
        })

        -- Sync LSP references/imports when a file is renamed in mini.files
        autocmd("User", {
            group = mini_group,
            pattern = "MiniFilesActionRename",
            callback = function(event)
                Snacks.rename.on_rename_file(event.data.from, event.data.to)
            end,
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
