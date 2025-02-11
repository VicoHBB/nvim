-- ============================================================================
-- Local variables
-- ============================================================================
local keyset = vim.keymap.set

-- ============================================================================
-- Buffer variables
-- ============================================================================
vim.bo.tabstop     = 4
vim.bo.softtabstop = 4
vim.bo.expandtab   = true
vim.bo.shiftwidth  = 4
vim.wo.colorcolumn = "80"
vim.bo.autoindent  = true
vim.bo.smartindent = true

-- ============================================================================
-- Autocommands
-- ============================================================================

-- ============================================================================
-- Keymaps
-- ============================================================================

-- Compilation & Execution
keyset('n', "<F9>", "<CMD>CMakeBuild<CR>", {
  buffer = 0,
  noremap = true,
  silent = true,
  desc = "Build project",
})

keyset('n', "<F10>", "<CMD>CMakeRun<CR>", {
  buffer = 0,
  noremap = true,
  silent = true,
  desc = "Run project",
})

keyset('n', "<leader>vr", "<CMD>OverseerRunCmd make run<CR>", {
  buffer = 0,
  noremap = true,
  silent = true,
  desc = "Run simulation with Verilator",
})

-- Utilities
keyset('n', '<leader>O', '<CMD>Lspsaga outline<CR>', {
  buffer = 0,
  noremap = true,
  silent= true,
  desc = "Outline symbols",
})
