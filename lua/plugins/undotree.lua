return {
  "jiaoshijie/undotree",
  dependencies = "nvim-lua/plenary.nvim",
  config = true,
  event = "VeryLazy",
  keys = { -- load the plugin only when using it's keybinding:
    {
      "<leader>U",
      "<cmd>lua require('undotree').toggle()<cr>",
      desc = "Toggle UndoTree",
    },
  },
}
