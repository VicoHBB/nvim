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
      "gA",
      desc = "Show All representations of number under cursor",
    },
    {
      "crd",
      "crd",
      desc = "Convert number under cursor to Decimal",
    },
    {
      "crx",
      "crx",
      desc = "Convert number under cursor to Hexadecimal",
    },
    {
      "cro",
      "cro",
      desc = "Convert number under cursor to Octal",
    },
    {
      "crb",
      "crb",
      desc = "Convert number under cursor to Binary",
    },
  },
}
