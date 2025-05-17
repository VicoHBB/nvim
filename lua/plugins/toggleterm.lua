return {
    'akinsho/toggleterm.nvim',
    enabled = Is_Not_Win32, -- @TODO: Review this
    -- lazy = true,
    -- event = "VeryLazy",
    cmd = {
        "ToggleTerm",
        "TermExec",
    },
    version = "*",
    opts = {
        open_mapping = "<F2>",
    },
    init = function()
        local autocmd = vim.api.nvim_create_autocmd
        local commands = require('core.custom_commands')
        autocmd("User", {
            -- @TODO: Find the way to executen when run "nvim file.py/file.lua"
            -- pattern = "VeryLazy",
            -- pattern = { "lua", "python" },
            callback = commands.set_repl
        })
    end,
    keys = {
        {
            "<F2>",
            desc = "Open ToggleTerm"
        },
        {
            '<F3>',
            function()
                vim.cmd("TermSelect")
            end,
            mode = { 'n' },
            silent = true,
            desc = "Select Terminal",
        },
        {
            '<F12>',
            function()
                vim.cmd("REPL")
            end,
            mode = { 'n' },
            ft = { "lua", "python" },
            silent = true,
            desc = "Start REPL",
        },
    }
}
