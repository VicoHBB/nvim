return {
  "glts/vim-radical",
  enabled = true,
  -- event = "VeryLazy",
  dependencies = {
    "glts/vim-magnum",
    "tpope/vim-repeat",
  },
  keys = {
    -- @TODO: Check if this works fine
    {
      "gA",
      desc = "Show All representations of number under cursor",
    },
    {
      "crd",
      desc = "Convert number under cursor to Decimal",
    },
    {
      "crx",
      desc = "Convert number under cursor to Hexadecimal",
    },
    {
      "cro",
      desc = "Convert number under cursor to Octal",
    },
    {
      "crb",
      desc = "Convert number under cursor to Binary",
    },
  },
}
