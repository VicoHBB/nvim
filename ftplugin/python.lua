-- ============================================================================
-- Local variables
-- ============================================================================
local cmd = vim.api.nvim_create_user_command
local add_cmd = vim.api.nvim_create_autocmd
local commands = require('core.custom_commands')
local trim_spaces = false

-- ============================================================================
-- Buffer variables
-- ============================================================================
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

keyset("n", "<F9>", "<CMD>REPL<CR> name='REPL'", {
  buffer = 0,
  noremap = true,
  silent = true,
  desc = "REPL",
})

keyset("n", "<F10>", "<CMD>2TermExec cmd='dofile(%)'<CR>", {
  buffer = 0,
  noremap = true,
  silent = true,
  desc = "REPL",
})

-- Utilities

-- vim.keymap.set("v", "<space>rl", function()
--     -- require("toggleterm").send_lines_to_terminal("single_line", trim_spaces, { args = vim.v.count })
--     require("toggleterm").send_lines_to_terminal("visual_lines", trim_spaces, { args = 1 })
-- end)

-- vim.keymap.set("n", "<leader>rl", function()
--     require("toggleterm").send_lines_to_terminal("single_line", trim_spaces, { args = 1 })
-- end)
