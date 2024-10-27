-- ============================================================================
-- Local variables
-- ============================================================================
local keyset = vim.keymap.set
local add_cmd = vim.api.nvim_create_autocmd
local commands = require('core.custom_commands')
local trim_spaces = true

-- ============================================================================
-- Buffer variables
-- ============================================================================
vim.bo.tabstop     = 2
vim.bo.softtabstop = 2
vim.bo.expandtab   = true
vim.bo.shiftwidth  = 2
vim.wo.colorcolumn = "80"

-- ============================================================================
-- Autocommands
-- ============================================================================
-- REPL
add_cmd('FileType', {
  pattern = { 'lua', 'python' },
  callback = function()
    commands.start_repl()
  end
})

-- ============================================================================
-- Keymaps
-- ============================================================================

-- Compilation & Simulation

keyset("n", "<F9>", "<CMD>2TermExec cmd='dofile(%)'<CR>", {
  buffer = 0,
  noremap = true,
  silent = true,
  desc = "REPL",
})

keyset("n", "<F10>", "<CMD>REPL<CR> name='REPL'", {
  buffer = 0,
  noremap = true,
  silent = true,
  desc = "REPL",
})

-- Utilities

-- keyset("v", "<space>rl", function()
--     -- require("toggleterm").send_lines_to_terminal("single_line", trim_spaces, { args = vim.v.count })
--     require("toggleterm").send_lines_to_terminal("visual_lines", trim_spaces, { args = 1 })
-- end)


-- keyset("n", "<leader>rl", function()
--     require("toggleterm").send_lines_to_terminal("single_line", trim_spaces, { args = 1 })
-- end)

-- Utilities
keyset('n', '<leader>O', '<CMD>Lspsaga outline<CR>', {
  buffer = 0,
  noremap = true,
  silent= true,

  desc = "Outline symbols",
})
