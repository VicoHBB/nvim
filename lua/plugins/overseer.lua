return { -- The task runner we use
  "stevearc/overseer.nvim",
  enabled = true,
  -- event = "VeryLazy",
  cmd = {
    "OverseerOpen",
    "OverseerClose",
    "OverseerToggle",
    "OverseerSaveBundle",
    "OverseerLoadBundle",
    "OverseerDeleteBundle",
    "OverseerRunCmd",
    "OverseerRun",
    "OverseerInfo",
    "OverseerBuild",
    "OverseerQuickAction",
    "OverseerTaskAction",
    "OverseerClearCache",
  },
  opts = {
    strategy = {
      "jobstart",
      -- use_terminal = true,
    },
    task_list = {
      default_detail = 1,
      max_width = { 100, 0.2 },
      min_width = { 40, 0.1 },
      max_height = { 10, 0.1 },
      direction = "bottom",
      bindings = {
        ["?"] = "ShowHelp",
        ["g?"] = "ShowHelp",
        ["<CR>"] = "RunAction",
        ["<C-e>"] = "Edit",
        ["o"] = "Open",
        ["<C-v>"] = "OpenVsplit",
        ["<C-s>"] = "OpenSplit",
        ["<C-f>"] = false,
        ["<C-q>"] = "OpenQuickFix",
        ["p"] = "TogglePreview",
        ["<Tab>"] = "IncreaseDetail",
        ["<S-Tab>"] = "DecreaseDetail",
        ["["] = "DecreaseWidth",
        ["]"] = "IncreaseWidth",
        ["{"] = "PrevTask",
        ["}"] = "NextTask",
        ["<C-u>"] = "ScrollOutputUp",
        ["<C-d>"] = "ScrollOutputDown",
        ["q"] = "Close",
      },
    },
    component_aliases = {
      -- Most tasks are initialized with the default components
      default = {
        { "display_duration",    detail_level = 1 },
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
      },
    },
  },
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
        require('core.custom_functions').overseer_last_task()
      end,
      mode = { 'n' },
      silent = true,
      desc = "ReRun Task",
    },
  }
}
