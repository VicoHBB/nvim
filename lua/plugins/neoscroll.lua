return {
  "karb94/neoscroll.nvim",                                        -- Neoscroll
  config = function()

    local key = {}

    require('neoscroll').setup({
      -- All these keys will be mapped to their corresponding default scrolling animation
      mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
                  '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
      hide_cursor = true,          -- Hide cursor while scrolling
      stop_eof = true,             -- Stop at <EOF> when scrolling downwards
      respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
      cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
      easing_function = nil,       -- Default easing function
      pre_hook = nil,              -- Function to run before the scrolling animation starts
      post_hook = nil,             -- Function to run after the scrolling animation ends
      performance_mode = false,    -- Disable "Performance Mode" on all buffers.
    })

    -- Syntax: key[keys] = {function, {function arguments}}
    -- Use the "sine" easing function
    key['<C-u>'] = {'scroll', {'-vim.wo.scroll', 'true', '350', [['sine']]}}
    key['<C-d>'] = {'scroll', { 'vim.wo.scroll', 'true', '350', [['sine']]}}
    -- Use the "circular" easing function
    key['<C-b>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '500', [['circular']]}}
    key['<C-f>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '500', [['circular']]}}
    -- Pass "nil" to disable the easing animation (constant scrolling speed)
    key['<C-y>'] = {'scroll', {'-0.10', 'false', '100', nil}}
    key['<C-e>'] = {'scroll', { '0.10', 'false', '100', nil}}
    -- When no easing function is provided the default easing function (in this case "quadratic") will be used
    key['zt']    = {'zt', {'300'}}
    key['zz']    = {'zz', {'300'}}
    key['zb']    = {'zb', {'300'}}

    require('neoscroll.config').set_mappings(key)

  end,
}
