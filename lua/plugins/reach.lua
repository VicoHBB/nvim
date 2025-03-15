return {
    'toppair/reach.nvim',
    enabled = true,
    -- event = "VeryLazy",
    config = function()
        -- default config
        require('reach').setup({
            notifications = true,
        })
    end,
    keys = {
        {
            '<leader>b',
            function()
                require('reach').buffers({
                    handle = 'dynamic',
                })
            end,
            mode = { 'n' },
            silent = true,
            desc = 'Switch Buffer',
        },
        {
            '<leader>\'',
            function()
                require('reach').marks()
            end,
            mode = { 'n' },
            silent = true,
            desc = 'Open Marks',
        },
        {
            '<leader>tb',
            function()
                require('reach').tabpages()
            end,
            mode = { 'n' },
            silent = true,
            desc = 'Switch Tabs',
        }
    }
}
