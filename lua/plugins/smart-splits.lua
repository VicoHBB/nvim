return {
    'smart-splits-nvim/smart-splits.nvim',
    enabled = true,
    lazy = false, -- @NOTE: backend-tmux only sets @pane-is-vim once the plugin loads
    dependencies = {
        -- @NOTE: Only for tmux, v3 ships no backends; swap it for your multiplexer's one
        { 'smart-splits-nvim/backend-tmux', main = 'smart-splits-backend-tmux' },
    },
    opts = {
        move = {
            at_edge = 'wrap', -- keep in sync with @smart-splits_at_edge in tmux.conf
            float = 'previous',
        },
        mux = {
            backend = 'smart-splits-backend-tmux',
        },
    },
    keys = {
        {
            '<C-h>',
            function()
                require('smart-splits').move_cursor_left()
            end,
            mode = { 'n', 't' },
            silent = true,
            desc = "Navigate Left",
        },
        {
            '<C-j>',
            function()
                require('smart-splits').move_cursor_down()
            end,
            mode = { 'n', 't' },
            silent = true,
            desc = "Navigate down",
        },
        {
            '<C-k>',
            function()
                require('smart-splits').move_cursor_up()
            end,
            mode = { 'n', 't' },
            silent = true,
            desc = "Navigate Up",
        },
        {
            '<C-l>',
            function()
                require('smart-splits').move_cursor_right()
            end,
            mode = { 'n', 't' },
            silent = true,
            desc = "Navigate Right",
        },
        {
            '<A-h>',
            function()
                require('smart-splits').resize_left()
            end,
            mode = { 'n', 't' },
            silent = true,
            desc = "Resize Left",
        },
        {
            '<A-j>',
            function()
                require('smart-splits').resize_down()
            end,
            mode = { 'n', 't' },
            silent = true,
            desc = "Resize Down",
        },
        {
            '<A-k>',
            function()
                require('smart-splits').resize_up()
            end,
            mode = { 'n', 't' },
            silent = true,
            desc = "Resize Up",
        },
        {
            '<A-l>',
            function()
                require('smart-splits').resize_right()
            end,
            mode = { 'n', 't' },
            silent = true,
            desc = "Resize Right",
        },
        {
            '<A-=>',
            "<C-w>=",
            mode = { 'n', 't' },
            silent = true,
            desc = "Equalize Splits",
        },
        {
            '<leader><C-h>',
            function()
                require('smart-splits').swap_buf_left()
            end,
            mode = { 'n' },
            silent = true,
            desc = "Swap to Left",
        },
        {
            '<leader><C-j>',
            function()
                require('smart-splits').swap_buf_down()
            end,
            mode = { 'n' },
            silent = true,
            desc = "Swap to down",
        },
        {
            '<leader><C-k>',
            function()
                require('smart-splits').swap_buf_up()
            end,
            mode = { 'n' },
            silent = true,
            desc = "Swap to Up",
        },
        {
            '<leader><C-l>',
            function()
                require('smart-splits').swap_buf_right()
            end,
            mode = { 'n' },
            silent = true,
            desc = "Swap to Right",
        },
    }
}
