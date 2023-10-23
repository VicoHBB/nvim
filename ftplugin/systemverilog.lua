local keyset = vim.keymap.set

vim.bo.tabstop     = 4
vim.bo.softtabstop = 4
vim.bo.expandtab   = true
vim.bo.shiftwidth  = 4
vim.wo.colorcolumn = "80"

-- Keymaps
keyset(
  'n',
  'gi',
  '<CMD>VerilogFollowInstance<CR>',
  {
    silent= true,
    desc = "Follow Instance"
  }
)
keyset(
  'n',
  'gp',
  '<CMD>VerilogFollowPort<CR>',
  {
    silent= true,
    desc = "Follow Port"
  }
)
keyset(
  'n',
  'gu',
  '<CMD>VerilogGotoInstanceStart<CR>',
  {
    silent= true,
    desc = "Go to Instance Start"
  }
)
keyset(
  'n',
  '<leader>V',
  '<CMD>VerilogErrorFormat Verilator 1<CR>',
  {
    silent= true,
    desc = "Set Verilator Error format"
  }
)
