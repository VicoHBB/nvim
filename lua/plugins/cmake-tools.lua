return {
  'Civitasv/cmake-tools.nvim',
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
      end,                                       -- this is used to specify generate directory for cmake, allows macro expansion, can be a string or a function returning the string, relative to cwd.
      cmake_soft_link_compile_commands = true,   -- this will automatically make a soft link from compile commands file to project root dir
      cmake_compile_commands_from_lsp = false,   -- this will automatically set compile commands file location using lsp, to use it, please set `cmake_soft_link_compile_commands` to false
      cmake_kits_path = nil,                     -- this is used to specify global cmake kits path, see CMakeKits for detailed usage
      cmake_variants_message = {
        short = { show = true },                 -- whether to show short message
        long = { show = true, max_length = 40 }, -- whether to show long message
      },
      cmake_dap_configuration = {                -- debug settings for cmake
        name = "cpp",
        type = "codelldb",
        request = "launch",
        stopOnEntry = false,
        runInTerminal = true,
        console = "integratedTerminal",
      },
      cmake_executor = {                -- executor to use
        name = "overseer",              -- name of the executor
        opts = {},                      -- the options the executor will get, possible values depend on the executor type. See `default_opts` for possible values.
        default_opts = {                -- a list of default and possible values for executors
          quickfix = {
            show = "always",            -- "always", "only_on_error"
            position = "belowright",    -- "vertical", "horizontal", "leftabove", "aboveleft", "rightbelow", "belowright", "topleft", "botright", use `:h vertical` for example to see help on them
            size = 10,
            encoding = "utf-8",         -- if encoding is not "utf-8", it will be converted to "utf-8" using `vim.fn.iconv`
            auto_close_when_success = true, -- typically, you can use it with the "always" option; it will auto-close the quickfix buffer if the execution is successful.
          },
          overseer = {
            new_task_opts = {
              strategy = {
                "jobstart",
              },
              component_aliases = {
                { "display_duration", detail_level = 1 },
                "on_output_summarize",
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
              }
            }, -- options to pass into the `overseer.new_task` command
            -- on_new_task = function(task)
            --   require("overseer").open(
            --     { enter = false, direction = "right" }
            --   )
            -- end, -- a function that gets overseer.Task when it is created, before calling `task:start`
          },
        },
      },
      cmake_runner = {           -- runner to use
        name = "overseer",       -- name of the runner
        opts = {},               -- the options the runner will get, possible values depend on the runner type. See `default_opts` for possible values.
        default_opts = {         -- a list of default and possible values for runners
          toggleterm = {
            direction = "horizontal", -- 'vertical' | 'horizontal' | 'tab' | 'float'
            close_on_exit = false, -- whether close the terminal when exit
            auto_scroll = true, -- whether auto scroll to the bottom
            singleton = true,  -- single instance, autocloses the opened one, if present
          },
          overseer = {
            new_task_opts = {
              strategy = {
                "jobstart",
              },
              component_aliases = {
                { "display_duration", detail_level = 1 },
                "on_output_summarize",
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
              }
            }, -- options to pass into the `overseer.new_task` command
            -- on_new_task = function(task)
            -- end, -- a function that gets overseer.Task when it is created, before calling `task:start`
          },
        },
      },
      cmake_notifications = {
        runner = { enabled = true },
        executor = { enabled = true },
        spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }, -- icons used for progress display
        refresh_rate_ms = 100, -- how often to iterate icons
      },
      cmake_virtual_text_support = true, -- Show the target related to current file using virtual text (at right corner)

    })
  end
}
