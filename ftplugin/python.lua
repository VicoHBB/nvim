-- ============================================================================
-- Local variables
-- ============================================================================
local keyset      = vim.keymap.set

-- ============================================================================
-- Buffer variables
-- ============================================================================
vim.bo.autoindent  = true


-- ============================================================================
-- Keymaps
-- ============================================================================

-- Compilation & Simulation

keyset('n', "<F9>", "<CMD>OverseerRun UVRun<CR>",
    {
        buffer = 0,
        noremap = true,
        silent = true,
        desc = "Run UV Project",
    }
)

keyset('n', "<F10>", "<CMD>OverseerRun UVTest<CR>",
    {
        buffer = 0,
        noremap = true,
        silent = true,
        desc = "Run UV Pytest",
    }
)
