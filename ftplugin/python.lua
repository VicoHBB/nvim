-- ============================================================================
-- Local variables
-- ============================================================================
local keyset      = vim.keymap.set
local trim_spaces = false

-- ============================================================================
-- Buffer variables
-- ============================================================================
vim.wo.colorcolumn = "120"
vim.bo.textwidth   = 120
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

keyset("n", "<leader>rf", "<CMD>TermExec cmd='run %'<CR>", {
    buffer = 0,
    noremap = true,
    silent = true,
    desc = "Run File On REPL",
})


-- Utilities
keyset("v", "<leader>rl", function()
        -- require("toggleterm").send_lines_to_terminal("single_line", trim_spaces, { args = vim.v.count })
        require("toggleterm").send_lines_to_terminal("visual_lines", trim_spaces, { args = 1 })
    end,
    {
        buffer = 0,
        noremap = true,
        silent = true,
        desc = "Run lines on REPL",
    }
)

keyset("n", "<leader>rl", function()
        require("toggleterm").send_lines_to_terminal("single_line", trim_spaces, { args = 1 })
    end,
    {
        buffer = 0,
        noremap = true,
        silent = true,
        desc = "Run lines on REPL",
    }
)
