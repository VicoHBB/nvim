local keyset = vim.keymap.set

vim.bo.tabstop     = 4
vim.bo.softtabstop = 4
vim.bo.expandtab   = true
vim.bo.shiftwidth  = 4
vim.wo.colorcolumn = "80"

-- Keymaps
keyset(
  'n',
  'fi',
  '<CMD>VerilogFollowInstance<CR>',
  { silent= true }
)
keyset(
  'n',
  'fp',
  '<CMD>VerilogFollowPort<CR>',
  { silent= true }
)
keyset(
  'n',
  '<leader>u',
  '<CMD>VerilogGotoInstanceStart<CR>',
  { silent= true }
)
keyset(
  'n',
  '<leader>V',
  '<CMD>VerilogErrorFormat Verilator 1<CR>',
  { silent= true }
)
