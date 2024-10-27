return {
  'toppair/reach.nvim',
  event = "VeryLazy",
  config = function()
    -- default config
    require('reach').setup({
      notifications = true,
    })
  end,
}
