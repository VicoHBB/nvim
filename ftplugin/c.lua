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
vim.bo.autoindent  = true
vim.bo.smartindent = true

-- ============================================================================
-- Autocommands
-- ============================================================================

-- ============================================================================
-- Keymaps
-- ============================================================================

-- Toggle src & header
keyset('n', "<leader>ah", function()
        vim.cmd("LspClangdSwitchSourceHeader")
    end,
    {
        buffer = 0,
        noremap = true,
        silent = true,
        desc = "Clangd Alternate Header/Source"
    }
)
