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
vim.wo.colorcolumn = "100"

-- ============================================================================
-- Keymaps
-- ============================================================================
keyset('n', "<F9>", ":OverseerRun<CR>", {
  buffer = 0,
  noremap = true,
  silent = true,
  desc = "Run Makefile",
})
