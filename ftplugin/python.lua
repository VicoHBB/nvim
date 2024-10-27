-- ============================================================================
-- Local variables
-- ============================================================================
local cmd = vim.api.nvim_create_user_command
local keyset = vim.keymap.set
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
  once = true,
  callback = function()
    commands.start_repl()
  end
})

-- ============================================================================
-- Keymaps
-- ============================================================================

-- Compilation & Simulation

keyset("n", "<F9>", "<CMD>TermExec cmd='run %'<CR>", {
  buffer = 0,
  noremap = true,
  silent = true,
  desc = "Run file",
})

keyset("n", "<F10>", "<CMD>REPL<CR>", {
  buffer = 0,
  noremap = true,
  silent = true,
  desc = "REPL",
})

-- Utilities

vim.keymap.set("v", "<space>rl", function()
    -- require("toggleterm").send_lines_to_terminal("single_line", trim_spaces, { args = vim.v.count })
    require("toggleterm").send_lines_to_terminal("visual_lines", trim_spaces, { args = 1 })
end)

vim.keymap.set("n", "<leader>rl", function()
    require("toggleterm").send_lines_to_terminal("single_line", trim_spaces, { args = 1 })
end)

-- Utilities
keyset('n', '<leader>O', '<CMD>Lspsaga outline<CR>', {
  buffer = 0,
  noremap = true,
  silent= true,
  desc = "Outline symbols",
})
