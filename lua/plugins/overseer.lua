return { -- The task runner we use
  "stevearc/overseer.nvim",
  -- commit = "400e762648b70397d0d315e5acaf0ff3597f2d8b",
  opts = {
    -- strategy = {
    --   "terminal",
    -- },
    task_list = {
      direction = "bottom",
      min_height = 10,
      max_height = 10,
      default_detail = 1
    },
    component_aliases = {
      -- Most tasks are initialized with the default components
      default = {
        { "display_duration",    detail_level = 1 },
        "on_output_summarize",
        "on_exit_set_status",
        "on_complete_notify",
        { "on_complete_dispose", require_view = { "SUCCESS", "FAILURE" } },
        "on_result_diagnostics_quickfix",
      },
      -- Tasks from tasks.json use these components
      default_vscode = {
        "default",
        "on_result_diagnostics",
      },
    },
  },
}
