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
  },
}
