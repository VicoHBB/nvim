return {
  'akinsho/toggleterm.nvim',
  enabled = true,
  -- event = "VeryLazy",
  cmd = {
    "ToggleTerm",
    "TermExec",
  },
  version = "*",
  opts = {
    open_mapping = "<F2>",
  },
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
      '<F10>',
      function()
        vim.cmd("REPL")
      end,
      mode = { 'n' },
      ft = { "lua", "python" },
      silent = true,
      desc = "Select Terminal",
    },
  }
}
