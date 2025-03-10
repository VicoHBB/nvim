return {
  'mrjones2014/smart-splits.nvim',
  enabled = true,
  -- lazy = false, -- Recommend (@TODO: Check this)
  -- build = './kitty/install-kittens.bash',
  opts = function ()
    return {
      at_edge = 'wrap', -- split doesn't work on kitty
      float_win_behavior = 'previous',
    }
  end,
  config = function(_, opts)
    require('smart-splits').setup(opts)
  end,
  keys = {
    {
      '<C-h>',
      function()
        require('smart-splits').move_cursor_left()
      end,
      mode = { 'n', 't' },
      silent = true,
      desc = "Navigate Left",
    },
    {
      '<C-j>',
      function()
        require('smart-splits').move_cursor_down()
      end,
      mode = { 'n', 't' },
      silent = true,
      desc = "Navigate down",
    },
    {
      '<C-k>',
      function()
        require('smart-splits').move_cursor_up()
      end,
      mode = { 'n', 't' },
      silent = true,
      desc = "Navigate Up",
    },
    {
      '<C-l>',
      function()
        require('smart-splits').move_cursor_right()
      end,
      mode = { 'n', 't' },
      silent = true,
      desc = "Navigate Right",
    },
    {
      '<C-\\><c-\\>',
      function()
        require('smart-splits').move_cursor_previous()
      end,
      mode = { 'n', 't' },
      silent = true,
      desc = "Navigate to Previous",
    },
    {
      '<A-h>',
      function()
        require('smart-splits').resize_left()
      end,
      mode = { 'n', 't' },
      silent = true,
      desc = "Resize Left",
    },
    {
      '<A-j>',
      function()
        require('smart-splits').resize_down()
      end,
      mode = { 'n', 't' },
      silent = true,
      desc = "Resize down",
    },
    {
      '<A-k>',
      function()
        require('smart-splits').resize_up()
      end,
      mode = { 'n', 't' },
      silent = true,
      desc = "Resize Up",
    },
    {
      '<A-l>',
      function()
        require('smart-splits').resize_right()
      end,
      mode = { 'n', 't' },
      silent = true,
      desc = "Resize Right",
    },
    {
      '<A-=>',
      "<C-w>=",
      mode = { 'n', 't' },
      silent = true,
      desc = "Rezize Right",
    },
    {
      '<leader><C-h>',
      function()
        require('smart-splits').swap_buf_left()
      end,
      mode = { 'n', 't' },
      silent = true,
      desc = "Swap to Left",
    },
    {
      '<leader><C-j>',
      function()
        require('smart-splits').swap_buf_down()
      end,
      mode = { 'n', 't' },
      silent = true,
      desc = "Swap to down",
    },
    {
      '<leader><C-k>',
      function()
        require('smart-splits').swap_buf_up()
      end,
      mode = { 'n', 't' },
      silent = true,
      desc = "Swap to Up",
    },
    {
      '<leader><C-l>',
      function()
        require('smart-splits').swap_buf_right()
      end,
      mode = { 'n', 't' },
      silent = true,
      desc = "Swap to Right",
    },
  }
}
