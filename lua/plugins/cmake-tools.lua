return {
    'Civitasv/cmake-tools.nvim',
    enabled = Is_Not_Win32, -- @TODO: Review this
    ft = {
        "c",
        "cpp",
        "cmake",
    },
    config = function()
        local osys = require("cmake-tools.osys")
        require("cmake-tools").setup({
            cmake_command = "cmake",                                          -- this is used to specify cmake command path
            ctest_command = "ctest",                                          -- this is used to specify ctest command path
            cmake_use_preset = true,
            cmake_regenerate_on_save = true,                                  -- auto generate when save CMakeLists.txt
            cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" }, -- this will be passed when invoke `CMakeGenerate`
            cmake_build_options = {},                                         -- this will be passed when invoke `CMakeBuild`
            -- support macro expansion:
            --       ${kit}
            --       ${kitGenerator}
            --       ${variant:xx}
            cmake_build_directory = function()
                if osys.iswin32 then
                    return "out\\${variant:buildType}"
                end
                return "out/${variant:buildType}"
            end,                                          -- this is used to specify generate directory for cmake, allows macro expansion, can be a string or a function returning the string, relative to cwd.
            cmake_soft_link_compile_commands = true,      -- this will automatically make a soft link from compile commands file to project root dir
            cmake_compile_commands_from_lsp = false,      -- this will automatically set compile commands file location using lsp, to use it, please set `cmake_soft_link_compile_commands` to false
            cmake_kits_path = nil,                        -- this is used to specify global cmake kits path, see CMakeKits for detailed usage
            cmake_variants_message = {
                short = { show = true },                  -- whether to show short message
                long = { show = false, max_length = 40 }, -- whether to show long message
            },
            cmake_dap_configuration = {                   -- debug settings for cmake
                name = "cpp",
                type = "codelldb",
                request = "launch",
                stopOnEntry = false,
                runInTerminal = true,
                console = "integratedTerminal",
            },
            cmake_executor = {     -- executor to use
                name = "overseer", -- name of the executor
                opts = {},         -- the options the executor will get, possible values depend on the executor type. See `default_opts` for possible values.
                default_opts = {   -- a list of default and possible values for executors
                    overseer = {   -- take defaults from over seer
                        new_task_opts = {
                            strategy = {
                                "jobstart",
                            }
                        },
                        on_new_task = function(task)
                            -- Do not open
                        end, -- a function that gets overseer.Task when it is created, before calling `task:start`
                    },
                },
            },
            cmake_runner = {                         -- runner to use
                name = "overseer",                   -- name of the runner
                opts = {},                           -- the options the runner will get, possible values depend on the runner type. See `default_opts` for possible values.
                default_opts = {                     -- a list of default and possible values for runners
                    overseer = {                     -- Take defaults from overseer
                        new_task_opts = {
                            strategy = {
                                "jobstart",
                            }
                        },
                        on_new_task = function(task) -- Open Runner
                            require("overseer").open(
                                {
                                    enter = false,
                                }
                            ) -- Open the runner???
                        end,  -- a function that gets overseer.Task when it is created, before calling `task:start`
                    },
                },
            },
            cmake_notifications = { -- With this options goes slow
                runner = { enabled = false },
                executor = { enabled = false },
            },
            cmake_virtual_text_support = false, -- Show the target related to current file using virtual text (at right corner)

        })
    end,
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
