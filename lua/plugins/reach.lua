return {
  'toppair/reach.nvim',
  event = "VeryLazy",
  config = function()
    -- default config
    require('reach').setup({
      notifications = true,
    })
  end,
  keys ={

    {
      '<leader>b',
      function()
        require('reach').buffers({
          handle = 'dynamic',
        })
      end,
      mode = { 'n' },
      silent = true,
      desc = 'Switch Buffer',
    },
    {
      '<leader>\'',
      function()
        require('reach').marks()
      end,
      mode = { 'n' },
      silent = true,
      desc = 'Marks',
    },

  }
}
