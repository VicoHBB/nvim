-- ============================================================================
-- Local variables
-- ============================================================================
local keyset = vim.keymap.set
local add_cmd = vim.api.nvim_create_autocmd

-- ============================================================================
-- Buffer variables
-- ============================================================================
vim.bo.tabstop     = 4
vim.bo.softtabstop = 4
vim.bo.expandtab   = true
vim.bo.shiftwidth  = 4
vim.wo.colorcolumn = "100"

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
