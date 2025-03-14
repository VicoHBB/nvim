-- ============================================================================
-- Local variables
-- ============================================================================
local keyset       = vim.keymap.set
local trim_spaces  = true

-- ============================================================================
-- Buffer variables
-- ============================================================================
vim.bo.tabstop     = 4
vim.bo.softtabstop = 4
vim.bo.expandtab   = true
vim.bo.shiftwidth  = 4
vim.wo.colorcolumn = "120"

-- ============================================================================
-- Autocommands
-- ============================================================================

-- ============================================================================
-- Keymaps
-- ============================================================================

-- Compilation & Simulation

keyset("n", "<F9>", "<CMD>TermExec cmd='dofile(\"%\")'<CR>", {
    buffer = 0,
    noremap = true,
    silent = true,
    desc = "Run file",
})

keyset("n", "<F10>", "<CMD>REPL<CR>", {
    buffer = 0,
    noremap = true,
    silent = true,
    desc = "REPL",
})

-- Utilities

-- keyset("v", "<space>rl", function()
--     -- require("toggleterm").send_lines_to_terminal("single_line", trim_spaces, { args = vim.v.count })
--     require("toggleterm").send_lines_to_terminal("visual_lines", trim_spaces, { args = 1 })
--   end,
--   {
--     buffer = 0,
--     noremap = true,
--     silent = true,
--     desc = "Run lines on REPL",
--   }
-- )

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
