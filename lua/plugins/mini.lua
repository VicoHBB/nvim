return {
  'echasnovski/mini.nvim',
  version = '*',
  config = function()
    -- require('mini.icons').setup()
    -- require('mini.comment').setup()
    require('mini.ai').setup()
    require('mini.files').setup()
    require('mini.pairs').setup()
    require('mini.sessions').setup()
    require('mini.operators').setup({
      replace = {
        prefix = 'gr',
      },
      exchange = {
        prefix = '<leader>e',
      },
      sort = {
        prefix = '<leader>s',
      },
    })

    require('mini.align').setup({
      mappings = {
        start = 'ga',
        start_with_preview = '<leader>gA',
      },
    })

    require('mini.splitjoin').setup({
      mappings = {
        toggle = '<leader>st',
      },
    })

    require('mini.surround').setup({
      mappings = {
        add = 'ys',                    -- Add surrounding in Normal and Visual modes
        delete = 'ds',                 -- Delete surrounding
        find = '<leader>fs',           -- Find surrounding (to the right)
        find_left = '<leader>fS',      -- Find surrounding (to the left)
        highlight = '<leader>ys',      -- Highlight surrounding
        replace = 'cs',                -- Replace surrounding
        update_n_lines = '<leader>yn', -- Update `n_lines`
        suffix_last = 'L',             -- Suffix to search with "prev" method
        suffix_next = 'N',             -- Suffix to search with "next" method
      },
    })
  end,
}
