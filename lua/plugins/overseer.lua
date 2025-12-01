return { -- The task runner we use
    "stevearc/overseer.nvim",
    enabled = Is_Not_Win32, -- @TODO: Review this
    -- version = "v1.6.0",   -- @NOTE: To prevent errors
    cmd = {
        "OverseerRun",
        "OverseerInfo",
        "OverseerOpen",
        "OverseerBuild",
        "OverseerClose",
        "OverseerShell",
        "OverseerRunCmd",
        "OverseerToggle",
        "OverseerClearCache",
        "OverseerLoadBundle",
        "OverseerSaveBundle",
        "OverseerTaskAction",
        "OverseerQuickAction",
        "OverseerRestartLast",
        "OverseerDeleteBundle",
    },
    opts = function()
        return {
            strategy = {
                "jobstart",
            },
            task_list = {
                default_detail = 1,
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

                    -- Combine with smart-splits
                    ["<C-h>"] = {
                        function()
                            require('smart-splits').move_cursor_left()
                        end,
                        desc = "Navigate Left (smart-splits)",
                    },
                    ["<C-j>"] = {
                        function()
                            require('smart-splits').move_cursor_down()
                        end,
                        desc = "Navigate Donw (smart-splits)",
                    },
                    ["<C-k>"] = {
                        function()
                            require('smart-splits').move_cursor_up()
                        end,
                        desc = "Navigate Up (smart-splits)",
                    },
                    ["<C-l>"] = {
                        function()
                            require('smart-splits').move_cursor_right()
                        end,
                        desc = "Navigate Right (smart-splits)",
                    },
                    ['<A-h>'] = {
                        function()
                            require('smart-splits').resize_left()
                        end,
                        desc = "Resize Left (smart-splits)"
                    },
                    ['<A-j>'] = {
                        function()
                            require('smart-splits').resize_down()
                        end,
                        desc = "Resize Down (smart-splits)"
                    },
                    ['<A-k>'] = {
                        function()
                            require('smart-splits').resize_up()
                        end,
                        desc = "Resize Up (smart-splits)"
                    },
                    ['<A-l>'] = {
                        function()
                            require('smart-splits').resize_right()
                        end,
                        desc = "Resize Right (smart-splits)"
                    },

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
        }
    end,
    config = function(_, opts)
        local cmd = vim.api.nvim_create_user_command
        require('overseer').setup(opts)
        -- Create a cmd to rerun task
        cmd("OverseerRestartLast", function()
                local overseer = require("overseer")
                local tasks = overseer.list_tasks({ recent_first = true })
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
            "<F8>",
            function()
                require("overseer").toggle()
            end,
            mode = { 'n' },
            silent = true,
            desc = "Toggle Overseer",
        },
        {
            "<leader>rt",
            function()
                -- @TODO: Chamges vim.cmd for lua function
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
    }
}
