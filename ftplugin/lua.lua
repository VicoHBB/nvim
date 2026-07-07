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
vim.bo.textwidth   = 120

-- ============================================================================
-- Autocommands
-- ============================================================================

-- ============================================================================
-- Keymaps
-- ============================================================================


-- Compilation & Simulation

keyset("n", "<F9>", function()
        vim.cmd("OverseerRun LuaRunFile")
    end,
    {
        buffer = 0,
        noremap = true,
        silent = true,
        desc = "Run File",
    }
)

-- Utilities

keyset("n", "<leader>lf", function()
        vim.cmd("source %")
    end,
    {
        buffer = 0,
        noremap = true,
        silent = true,
        desc = "Source File on NVIM",
    }
)

keyset("n", "<leader>ll", ":.lua<CR>",
    {
        buffer = 0,
        noremap = true,
        silent = true,
        desc = "Run line on NVIM",
    }
)

keyset("v", "<leader>ll", ":lua<CR>",
    {
        buffer = 0,
        noremap = true,
        silent = true,
        desc = "Run Visual Selection on NVIM",
    }
)
