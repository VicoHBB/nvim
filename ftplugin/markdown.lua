-- ============================================================================
-- Local variables
-- ============================================================================
local keyset = vim.keymap.set

-- ============================================================================
-- Buffer variables
-- ============================================================================
vim.bo.tabstop     = 2
vim.bo.softtabstop = 2
vim.bo.expandtab   = true
vim.bo.shiftwidth  = 2
vim.wo.colorcolumn = "120"
vim.opt_local.wrap = false

-- ============================================================================
-- Keymaps
-- ============================================================================

keyset( 'n', "||",
  function ()
    vim.cmd("normal vip")
    vim.cmd("normal ga |")
    vim.notify("Table Aligned",vim.log.levels.INFO)
  end,
  {
    buffer = 0,
    noremap = true,
    silent= true,
    desc = "Align Table(Need to check)"
  }
)

keyset( 'v', "||",
  function ()
    vim.cmd("normal ga |")
    vim.notify("Table Aligned",vim.log.levels.INFO)
  end,
  {
    buffer = 0,
    noremap = true,
    silent= true,
    desc = "Align Table(Need to check)"
  }
)

keyset(
    'n',
    "\\t",
    "0120lbi<CR><ESC>0",
    {
        buffer = 0,
        noremap = true,
        silent = true,
        desc = "Limit text to 120 columns"
    }
)
