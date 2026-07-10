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
        require('mini.sessions').setup({ file = '.Session.vim' })
        require('mini.pairs').setup()
        require('mini.git').setup()

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

        -- Keymaps taken from gitlineage.nvim for MiniGit range-history buffers
        -- (show_range_history names them "minigit://<buf>/log -L...")
        autocmd("FileType", {
            group = mini_group,
            pattern = "git",
            callback = function(event)
                if not vim.api.nvim_buf_get_name(event.buf):match("^minigit://%d+/log %-L") then
                    return
                end

                local buf_keyset = function(lhs, rhs, desc)
                    vim.keymap.set("n", lhs, rhs, { buffer = event.buf, silent = true, desc = desc })
                end

                -- Traced file, taken from the buffer name ("log -L1,2:path REV")
                local rel_path = vim.api.nvim_buf_get_name(event.buf):match("%-L%d+,%d+:(.+) %S+$")

                buf_keyset("q", function()
                    vim.cmd("close")
                end, "Close")

                buf_keyset("]c", function()
                    if vim.fn.search("^commit ", "W") == 0 then
                        vim.notify("No more commits", vim.log.levels.INFO)
                    end
                end, "Next commit")

                buf_keyset("[c", function()
                    if vim.fn.search("^commit ", "bW") == 0 then
                        vim.notify("Already at first commit", vim.log.levels.INFO)
                    end
                end, "Previous commit")

                buf_keyset("yc", function()
                    local sha = vim.api.nvim_get_current_line():match("^commit (%x+)")
                    if not sha then
                        return vim.notify("Not on a commit line", vim.log.levels.WARN)
                    end
                    vim.fn.setreg('"', sha)
                    vim.fn.setreg("+", sha)
                    vim.notify("Yanked " .. sha:sub(1, 8))
                end, "Yank commit SHA")

                buf_keyset("<CR>", function()
                    local sha = vim.api.nvim_get_current_line():match("^commit (%x+)")
                    if not sha then
                        return vim.notify("Not on a commit line", vim.log.levels.WARN)
                    end

                    if pcall(require, "diffview") then
                        -- Root commit has no parent: diff against empty tree
                        vim.fn.systemlist({ "git", "rev-parse", "--verify", sha .. "^" })
                        vim.cmd("DiffviewOpen " .. sha .. (vim.v.shell_error == 0 and "^!" or ""))
                    else
                        vim.cmd("NDiff " .. sha .. "^ " .. sha .. " " .. vim.fn.fnameescape(rel_path))
                    end
                end, "Open commit diff")
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
            "<leader>ms",
            function()
                MiniSessions.write(vim.v.this_session == '' and MiniSessions.config.file or nil)
            end,
            mode = { "n" },
            silent = true,
            desc = "Save session"
        },
        {
            "<leader>gl",
            function()
                -- gitlineage-style auto split: wide window → vertical
                local wide = vim.api.nvim_win_get_width(0) > 2 * vim.api.nvim_win_get_height(0)
                MiniGit.show_range_history({ split = wide and "vertical" or "horizontal" })
            end,
            mode = { "n", "v" },
            silent = true,
            desc = "Git history for selected lines"
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
