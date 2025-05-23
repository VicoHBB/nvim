-- ============================================================================
-- Local variables
-- ============================================================================
local keyset          = vim.keymap.set

-- ============================================================================
-- Buffer variables
-- ============================================================================
vim.opt.conceallevel  = 2
vim.opt.concealcursor = 'nc'

vim.bo.tabstop        = 2
vim.bo.softtabstop    = 2
vim.bo.expandtab      = true
vim.bo.shiftwidth     = 2
vim.wo.colorcolumn    = "120"
-- ============================================================================
-- Autocommands
-- ============================================================================

-- ============================================================================
-- Keymaps
-- ============================================================================
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
