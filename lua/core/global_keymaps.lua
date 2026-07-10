local keyset = vim.keymap.set

-- Run Lua codo
keyset('n', "<leader>lc", ":lua ",
    {
        silent = true,
        desc = "Run lua CMD"
    }
)

-- Quick Save
keyset('n', "<leader>w", ":w<CR>",
    {
        silent = true,
        desc = "Quick Save"
    }
)

-- Quick all Save
keyset('n', "<leader>W", "<CMD>wall<CR>",
    {
        silent = true,
        desc = "Quick Save All"
    }
)

-- Quick Quit
keyset('n', "<leader>q", ":q<CR>",
    {
        silent = true,
        desc = "Quick Quit"
    }
)
keyset('n', "<leader>Q", "<CMD>qall!<CR>",
    {
        silent = true,
        desc = "Force Quit All"
    }
)

-- Fast ';'
keyset('n', "<leader>;", "$a;<ESC>",
    {
        silent = true,
        desc = "Fast \";\" at the end of the line "
    }
)

-- Fast ',"
keyset('n', "<leader>,", "$a,<ESC>",
    {
        silent = true,
        desc = "Fast \",\" at the end of the line "
    }
)

-- Fast 'noh"
keyset('n', "<leader>H", "<CMD>noh<CR>", { silent = true })

-- Moves between buffers
keyset('n', "<leader>k", "<CMD>bnext<CR>", { silent = true })
keyset('n', "<leader>j", "<CMD>bprevious<CR>", { silent = true })

-- Split window
keyset('n', "<leader>|", "<CMD>vsp<CR>", { silent = true })
keyset('n', "<leader>_", "<CMD>sp<CR>", { silent = true })

keyset({ 'n', 'v' }, '<leader>rn', function()
        local text, word_boundary

        if 'n' == vim.fn.mode() then
            text = vim.fn.expand('<cword>')
            word_boundary = true
        else
            -- getpos('v') = selection anchor, getpos('.') = cursor (other end)
            local _, r1, c1 = unpack(vim.fn.getpos('v'))
            local _, r2, c2 = unpack(vim.fn.getpos('.'))
            -- normalize: ensure r1,c1 is always the start
            if r1 > r2 or (r1 == r2 and c1 > c2) then
                r1, r2 = r2, r1
                c1, c2 = c2, c1
            end
            local lines = vim.api.nvim_buf_get_text(0, r1 - 1, c1 - 1, r2 - 1, c2, {})
            text = table.concat(lines, '\n')
            word_boundary = false
        end

        local escaped = vim.fn.escape(text, '/\\.*$^~[')
        local pattern = word_boundary and ('\\<' .. escaped .. '\\>') or escaped
        -- <Esc> first to exit visual mode before opening the command line
        local cmd     = '<Esc>:%s/' .. pattern .. '/' .. escaped .. '/gI' .. string.rep('<Left>', 3)
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(cmd, true, false, true), 'n', false)
    end,
    {
        silent = true,
        desc = "Search and replace word/selection"
    }
)
