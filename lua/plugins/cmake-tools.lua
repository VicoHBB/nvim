return {
    'Civitasv/cmake-tools.nvim',
    enabled = Is_Not_Win32, -- @TODO: Review this
    ft = {
        "c",
        "cpp",
        "cmake",
    },
    init = function()
        local autocmd = vim.api.nvim_create_autocmd
        local buf_cmd = vim.api.nvim_buf_create_user_command

        -- :PurgeCMake wipes cmake-tools' session cache (~/.cache/cmake_tools_nvim)
        -- Lives in init (not config) because it doesn't need the plugin loaded
        -- No augroup: init runs once per startup, so the autocmd can't get registered twice.
        autocmd("FileType", {
            pattern = { "c", "cpp", "cmake" },
            callback = function(event)
                buf_cmd(event.buf, "PurgeCMake", function()
                    local cmake_cache_dir = vim.fn.expand('~') .. "/.cache/cmake_tools_nvim"

                    if vim.fn.isdirectory(cmake_cache_dir) > 0 then
                        vim.fn.delete(cmake_cache_dir, "rf")
                        vim.notify("CMake cache purged", vim.log.levels.INFO)
                    else
                        vim.notify("CMake cache directory not found", vim.log.levels.INFO)
                    end
                end, {
                    nargs = 0,
                    desc = "Clear CMake Cache"
                })
            end,
        })
    end,
    -- Only deltas from the plugin defaults (merged with tbl_deep_extend);
    -- no config needed: lazy.nvim auto-calls require("cmake-tools").setup(opts)
    opts = {
        cmake_variants_message = {
            long = { show = false },
        },
        cmake_executor = {
            name = "overseer",
            opts = {
                new_task_opts = {
                    strategy = { "jobstart" },
                },
                on_new_task = function()
                    -- Do not open the task list (default opens it at the right)
                end,
            },
        },
        cmake_runner = {
            name = "overseer",
            opts = {
                new_task_opts = {
                    strategy = { "jobstart" },
                },
                on_new_task = function()
                    require("overseer").open({ enter = false })
                end,
            },
        },
        cmake_notifications = { -- With this options goes slow
            runner = { enabled = false },
            executor = { enabled = false },
        },
        cmake_virtual_text_support = false, -- Show the target related to current file using virtual text (at right corner)
    },
    keys = {
        {
            "<F9>",
            function()
                vim.cmd("CMakeBuild")
            end,
            mode = { 'n' },
            ft = { "c", "cpp", "cmake" },
            noremap = true,
            silent = true,
            desc = "Build C/C++ Project",
        },
        {
            "<F10>",
            function()
                vim.cmd("CMakeRun")
            end,
            mode = { "n" },
            ft = { "c", "cpp", "cmake" },
            noremap = true,
            silent = true,
            desc = "Build C/C++ Project",
        },
        {
            "<F12>",
            function()
                vim.cmd("CMakeDebug")
            end,
            mode = { "n" },
            ft = { "c", "cpp", "cmake" },
            noremap = true,
            silent = true,
            desc = "Debug C/C++ Project",
        },
    }
}
