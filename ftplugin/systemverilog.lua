-- ============================================================================
-- Local variables
-- ============================================================================
local keyset = vim.keymap.set

-- ============================================================================
-- Buffer variables
-- ============================================================================
vim.bo.tabstop       = 4
vim.bo.softtabstop   = 4
vim.bo.expandtab     = true
vim.bo.shiftwidth    = 4
vim.wo.colorcolumn   = "120"
vim.bo.autoindent    = true
vim.bo.smartindent   = true
vim.bo.commentstring = "/* %s */"

-- ============================================================================
-- Autocommands
-- ============================================================================

-- ============================================================================
-- Keymaps
-- ============================================================================

-- Compilation & Simulation
keyset('n', "<F9>", ":OverseerRunCmd make all<CR>", {
    buffer = 0,
    noremap = true,
    silent = true,
    desc = "Build Verilator Project",
})

keyset('n', "<F10>", ":OverseerRunCmd make run<CR>", {
    buffer = 0,
    noremap = true,
    silent = true,
    desc = "Run simulation",
})

keyset('n', "<F11>", "<CMD>OverseerRunCmd make synth<CR>", {
    buffer = 0,
    noremap = true,
    silent = true,
    desc = "Synthesize project",
})

keyset('n', "<F12>", ":OverseerRunCmd make qrtl<CR>", {
    buffer = 0,
    noremap = true,
    silent = true,
    desc = "Synthesize and view RTL",
})

keyset('n', "<leader>mc", "<CMD>OverseerRunCmd make clean<CR>", {
    buffer = 0,
    noremap = true,
    silent = true,
    desc = "Clean project",
})

keyset('n', "<leader>vv", "<CMD>OverseerRunCmd make view<CR>", {
    buffer = 0,
    noremap = true,
    silent = true,
    desc = "View RTL schematic diagram",
})

keyset('n', "<leader>vf", "<CMD>OverseerRunCmd make qfull<CR>", {
    buffer = 0,
    noremap = true,
    silent = true,
    desc = "View RTL schematic diagram",
})

keyset('n', "<leader>vr", "<CMD>OverseerRunCmd make run<CR>", {
    buffer = 0,
    noremap = true,
    silent = true,
    desc = "Run simulation",
})

keyset('n', "<leader>vy", "<CMD>OverseerRunCmd make ys<CR>", {
    buffer = 0,
    noremap = true,
    silent = true,
    desc = "View simple RTL diagram with Yosys",
})
