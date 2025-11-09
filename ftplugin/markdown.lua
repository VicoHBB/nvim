-- ============================================================================
-- Local variables
-- ============================================================================
local keyset       = vim.keymap.set


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
-- Autocommands
-- ============================================================================

-- ============================================================================
-- Keymaps
-- ============================================================================

-- keyset( 'n', "||",
--   function ()
--     -- vim.cmd("normal vip")
--     print("Need to check")
--   end,
--   {
--     buffer = 0,
--     noremap = true,
--     silent= true,
--     desc = "Align Table(Need to check)"
--   }
-- )

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
