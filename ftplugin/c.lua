-- ============================================================================
-- Local variables
-- ============================================================================
local keyset       = vim.keymap.set

-- ============================================================================
-- Buffer variables
-- ============================================================================
vim.bo.tabstop     = 4
vim.bo.softtabstop = 4
vim.bo.expandtab   = true
vim.bo.shiftwidth  = 4
vim.wo.colorcolumn = "120"
vim.bo.autoindent  = true
vim.bo.smartindent = true

-- ============================================================================
-- Autocommands
-- ============================================================================

-- ============================================================================
-- Keymaps
-- ============================================================================

-- Toggle src & header
keyset('n', "<leader>ch", function()
        vim.cmd("ClangdSwitchSourceHeader")
    end,
    {
        buffer = 0,
        noremap = true,
        silent = true,
        desc = "Clangd Switch Source Header"
    }
)
