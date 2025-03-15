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

-- ============================================================================
-- Autocommands
-- ============================================================================
vim.cmd [[highlight Headline guibg=#3C3836]]
vim.cmd [[highlight CodeBlock guibg=#282828]]
vim.cmd [[highlight Dash guibg=#3C3836]]
vim.cmd [[highlight Quote guibg=#282828]]


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
