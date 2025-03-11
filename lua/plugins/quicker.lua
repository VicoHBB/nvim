return { -- quicker
  'stevearc/quicker.nvim',
  enabled = true,
  event = "FileType qf",
  ---@module "quicker"
  ---@type quicker.SetupOptions
  opts = {
    opts = {
      buflisted = false,
      number = true,
      relativenumber = true,
      signcolumn = "auto",
      winfixheight = true,
      wrap = false,
    },
    -- Set to false to disable the default options in `opts`
    use_default_opts = true,
    -- Keymaps to set for the quickfix buffer
    keys = {
      -- { ">", "<cmd>lua require('quicker').expand()<CR>", desc = "Expand quickfix content" },
    },
    -- Callback function to run any custom logic or keymaps for the quickfix buffer
    on_qf = function(bufnr) end,
    edit = {
      -- Enable editing the quickfix like a normal buffer
      enabled = true,
      -- Set to true to write buffers after applying edits.
      -- Set to "unmodified" to only write unmodified buffers.
      autosave = "unmodified",
    },
    -- Keep the cursor to the right of the filename and lnum columns
    constrain_cursor = true,
    highlight = {
      -- Use treesitter highlighting
      treesitter = true,
      -- Use LSP semantic token highlighting
      lsp = true,
      -- Load the referenced buffers to apply more accurate highlights (may be slow)
      load_buffers = true,
    },
    -- Map of quickfix item type to icon
    type_icons = {
      E = "",
      W = "",
      I = "",
      N = "",
      H = "",
    },
    -- Border characters
    borders = {
      vert = "┃",
      -- Strong headers separate results from different files
      strong_header = "━",
      strong_cross = "╋",
      strong_end = "┫",
      -- Soft headers separate results within the same file
      soft_header = "╌",
      soft_cross = "╂",
      soft_end = "┨",
    },
    -- Trim the leading whitespace from results
    trim_leading_whitespace = true,
    -- Maximum width of the filename column
    max_filename_width = function()
      return math.floor(math.min(31, vim.o.columns / 2))
    end,
    -- How far the header should extend to the right
    header_length = function(type, start_col)
      return vim.o.columns - start_col
    end,
  },
  keys = {
    -- This plugin has the CMD to toggle quickfix, so there is gonna set
    -- more keymaps for quickfix
    {
      "<F7>",
      function()
        require('quicker').toggle()
      end,
      silent = true,
      mode = { 'n' },
      desc = 'Toggle quickfix',
    },
    {
      "<F6>",
      function()
        require('quicker').toggle({
          loclist = true
        })
      end,
      mode = { 'n' },
      silent = true,
      desc = 'Toggle loclist',
    },
    {
      '<leader>cp',
      function()
        vim.cmd("cprevious")
        vim.cmd("normal zz")
      end,
      mode = { 'n' },
      silent = true,
      desc = 'Go to Previous item on Quickfix',
    },
    {
      '<leader>(',
      '<CMD>cprevious<CR>zz',
      mode = { 'n' },
      silent = true,
      desc = 'Go to Previous item on Quickfix',
    },
    {
      '<leader>cn',
      -- '<CMD>cnext<CR>zz',
      function()
        vim.cmd("cnext")
        vim.cmd("normal zz")
      end,
      mode = { 'n' },
      silent = true,
      desc = 'Go to Next item on Quickfix',
    },
    {
      '<leader>)',
      function()
        vim.cmd("cnext")
        vim.cmd("normal zz")
      end,
      mode = { 'n' },
      silent = true,
      desc = 'Go to Next item on Quickfix',
    },
  }
}
