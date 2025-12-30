-- ============================================================================
-- Local variables
-- ============================================================================
local keyset         = vim.keymap.set

-- ============================================================================
-- Buffer variables
-- ============================================================================
vim.bo.tabstop       = 4
vim.bo.softtabstop   = 4
vim.bo.expandtab     = true
vim.bo.shiftwidth    = 4
vim.wo.colorcolumn   = "120"
vim.bo.autoindent    = true
vim.bo.smartindent   = false
vim.bo.commentstring = "/* %s */"
vim.opt_local.wrap   = true
-- ============================================================================
-- Autocommands
-- ============================================================================

-- ============================================================================
-- Keymaps
-- ============================================================================

-- Disable pairs for \' & \`
keyset('i', "'", "'", { buffer = 0 })
keyset('i', "`", "`", { buffer = 0 })

-- Compilation & Simulation

keyset('n', "<F9>", ":OverseerShell make all<CR>", {
    buffer = 0,
    noremap = true,
    silent = true,
    desc = "Build Verilator Project",
})

keyset('n', "<F10>", ":OverseerShell make run<CR>", {
    buffer = 0,
    noremap = true,
    silent = true,
    desc = "Run Simulation",
})

keyset('n', "<F11>", "<CMD>OverseerShell make synth<CR>", {
    buffer = 0,
    noremap = true,
    silent = true,
    desc = "Synthesize project",
})

keyset('n', "<F12>", ":OverseerShell make qrtl<CR>", {
    buffer = 0,
    noremap = true,
    silent = true,
    desc = "Synthesize and view RTL",
})

keyset('n', "<leader>mc", "<CMD>OverseerShell make clean<CR>", {
    buffer = 0,
    noremap = true,
    silent = true,
    desc = "Clean project",
})

keyset('n', "<leader>vv", "<CMD>OverseerShell make view<CR>", {
    buffer = 0,
    noremap = true,
    silent = true,
    desc = "View RTL schematic diagram",
})

keyset('n', "<leader>vf", "<CMD>OverseerShell make qfull<CR>", {
    buffer = 0,
    noremap = true,
    silent = true,
    desc = "View RTL schematic diagram",
})

keyset('n', "<leader>vr", "<CMD>OverseerShell make run<CR>", {
    buffer = 0,
    noremap = true,
    silent = true,
    desc = "Run simulation",
})

keyset('n', "<leader>vy", "<CMD>OverseerShell make ys<CR>", {
    buffer = 0,
    noremap = true,
    silent = true,
    desc = "View simple RTL diagram with Yosys",
})
