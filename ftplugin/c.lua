-- ============================================================================
-- Local variables
-- ============================================================================
local keyset = vim.keymap.set

-- ============================================================================
-- Buffer variables
-- ============================================================================
vim.o.syntax="off"
vim.bo.tabstop     = 4
vim.bo.softtabstop = 4
vim.bo.expandtab   = true
vim.bo.shiftwidth  = 4
vim.wo.colorcolumn = "80"

-- ============================================================================
-- Autocommands
-- ============================================================================

-- ============================================================================
-- Keymaps
-- ============================================================================

-- Compilation & Execution
keyset('n', "<F9>", "<CMD>CMakeBuild<CR>", {
  silent = true,
  desc = "Build project",
})

keyset('n', "<F10>", "<CMD>CMakeRun<CR>", {
  silent = true,
  desc = "Run project",
})

-- Utilities
keyset('n', '<leader>O', '<CMD>Lspsaga outline<CR>', {
  silent= true,
  desc = "Outline symbols",
})
