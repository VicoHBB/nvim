return { -- The task runner we use
    "stevearc/overseer.nvim",
    enabled = Is_Not_Win32,
    -- version = "v1.6.0",   -- @NOTE: To prevent errors
    cmd = {
        "OverseerRun",
        "OverseerOpen",
        "OverseerClose",
        "OverseerShell",
        "OverseerToggle",
        "OverseerTaskAction",
        "OverseerRestartLast",
    },
    opts = {
        task_list = {
            max_width = { 100, 0.2 },
            min_width = { 40, 0.1 },
            max_height = { 10, 0.1 },
            direction = "bottom",
            keymaps = {
                ["?"] = "keymap.show_help",
                ["g?"] = "keymap.show_help",
                ["<CR>"] = "keymap.run_action",
                ["dd"] = { "keymap.run_action", opts = { action = "dispose" }, desc = "Dispose task" },
                ["<C-e>"] = { "keymap.run_action", opts = { action = "edit" }, desc = "Edit task" },
                ["o"] = "keymap.open",
                ["<C-v>"] = { "keymap.open", opts = { dir = "vsplit" }, desc = "Open task output in vsplit" },
                ["<C-s>"] = { "keymap.open", opts = { dir = "split" }, desc = "Open task output in split" },
                ["<C-t>"] = { "keymap.open", opts = { dir = "tab" }, desc = "Open task output in tab" },
                ["<C-q>"] = {
                  "keymap.run_action",
                  opts = { action = "open output in quickfix" },
                  desc = "Open task output in the quickfix",
                },
                ["p"] = "keymap.toggle_preview",

                ["["] = "keymap.prev_task",
                ["]"] = "keymap.next_task",

                ["<C-f>"] = "keymap.scroll_output_down",
                ["<C-b>"] = "keymap.scroll_output_up",

                ["g."] = "keymap.toggle_show_wrapped",
                ["q"] = { "<CMD>close<CR>", desc = "Close task list" },

                ["<C-u>"] ={  "<C-u>", desc = "Scroll Up" },
                ["<C-d>"] ={  "<C-d>", desc = "Scroll Down"},

                -- Disable keymaps
                ["{"] = false,
                ["}"] = false,
                ["<C-j>"] = false,
                ["<C-k>"] = false,
            },
        },
        component_aliases = {
            -- Most tasks are initialized with the default components
            default = {
                -- { "display_duration", detail_level = 1 },
                -- "on_output_summarize",
                "on_exit_set_status",
                "on_complete_notify",
                {
                    "on_complete_dispose",
                    require_view = {
                        "SUCCESS",
                        "FAILURE",
                        "CANCELED",
                    },
                },
                {
                    "on_output_quickfix",
                    open_on_exit = "failure",
                    close = true,
                    set_diagnostics = true,
                },
            },
        },
    },
    config = function(_, opts)
        local cmd = vim.api.nvim_create_user_command
        require('overseer').setup(opts)
        -- Create a cmd to rerun task
        cmd("OverseerRestartLast", function()
                local overseer = require("overseer")
                local tasks = overseer.list_tasks({
                    status = {
                        overseer.STATUS.SUCCESS,
                        overseer.STATUS.FAILURE,
                        overseer.STATUS.CANCELED,
                    },
                    sort = require("overseer.task_list").sort_finished_recently,
                })
                if vim.tbl_isempty(tasks) then
                    vim.notify("No tasks found", vim.log.levels.WARN)
                else
                    overseer.run_action(tasks[1], "restart")
                end
            end,
            {
                nargs = 0,
                desc = "Restart last task"
            }
        )
    end,
    keys = {
        {
            "<leader>rt",
            function()
                vim.cmd("OverseerRun")
            end,
            mode = { 'n' },
            silent = true,
            desc = "Run Task",
        },
        {
            "<leader>rr",
            function()
                vim.cmd("OverseerRestartLast")
            end,
            mode = { 'n' },
            silent = true,
            desc = "ReRun Task",
        },
        {
            "<F8>",
            function()
                require("overseer").toggle()
            end,
            mode = { 'n' },
            silent = true,
            desc = "Toggle Overseer",
        },
        -- <F9>
        {
            "<F9>",
            function()
                vim.cmd('VerilogErrorFormat Verilator 1')
                vim.cmd("OverseerShell make all")
            end,
            mode = { 'n' },
            ft = { "systemverilog", "verilog" },
            silent = true,
            desc = "Build Verilator Project",
        },
        {
            "<F9>",
            function()
                vim.cmd("OverseerRun UVRun")
            end,
            mode = { 'n' },
            ft = { "python" },
            silent = true,
            desc = "Run UV Project",
        },
        {
            "<F9>",
            function()
                vim.cmd("OverseerRun LuaRunFile")
            end,
            mode = { 'n' },
            ft = { "lua" },
            silent = true,
            desc = "Run File",
        },
        {
            "<F9>",
            function()
                vim.cmd("OverseerRun")
            end,
            mode = { 'n' },
            ft = { "make" },
            silent = true,
            desc = "Run Makefile",
        },
        -- <F9>
        -- <F10>
        {
            "<F10>",
            function()
                vim.cmd("OverseerShell make run")
            end,
            mode = { 'n' },
            ft = { "systemverilog", "verilog" },
            silent = true,
            desc = "Run Simulation",
        },
        {
            "<F10>",
            function()
                vim.cmd("OverseerRun UVTest")
            end,
            mode = { 'n' },
            ft = { "python" },
            silent = true,
            desc = "Run UV Pytest",
        },
        -- <F10>
        -- <F11>
        {
            "<F11>",
            function()
                vim.cmd("OverseerShell make synth")
            end,
            mode = { 'n' },
            ft = { "systemverilog", "verilog" },
            silent = true,
            desc = "Synthesize project",
        },
        -- <F11>
        -- <F12>
        {
            "<F12>",
            function()
                vim.cmd("OverseerShell make qrtl")
            end,
            mode = { 'n' },
            ft = { "systemverilog", "verilog" },
            silent = true,
            desc = "Synthesize and view RTL",
        },
        -- <F12>
        -- <leader> compilation keymaps
        -- <leader>mc
        {
            "<leader>mc",
            function()
                vim.cmd("OverseerShell make clean")
            end,
            mode = { 'n' },
            ft = { "systemverilog", "verilog" },
            silent = true,
            desc = "Clean project",
        },
        -- <leader>mc
        -- <leader>vv
        {
            "<leader>vv",
            function()
                vim.cmd("OverseerShell make view")
            end,
            mode = { 'n' },
            ft = { "systemverilog", "verilog" },
            silent = true,
            desc = "View RTL schematic diagram",
        },
        -- <leader>vv
        -- <leader>vf
        {
            "<leader>vf",
            function()
                vim.cmd("OverseerShell make qfull")
            end,
            mode = { 'n' },
            ft = { "systemverilog", "verilog" },
            silent = true,
            desc = "Full Quartus compilation",
        },
        -- <leader>vf
        -- <leader>vr
        { -- This is for Verilator tests
            "<leader>vr",
            function()
                vim.cmd("OverseerShell make run")
            end,
            mode = { 'n' },
            ft = { "cpp", "systemverilog", "verilog" },
            silent = true,
            desc = "Run simulation with Verilator",
        },
        -- <leader>vr
        -- <leader>vy
        {
            "<leader>vy",
            function()
                vim.cmd("OverseerShell make ys")
            end,
            mode = { 'n' },
            ft = { "systemverilog", "verilog" },
            silent = true,
            desc = "View simple RTL diagram with Yosys",
        }
        -- <leader>vy
    }
}
