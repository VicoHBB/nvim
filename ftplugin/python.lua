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

vim.keymap.set("n", "<F9>", "<CMD>REPL<CR>", {silent = true})
vim.keymap.set("n", "<F10>", "<CMD>TermExec cmd='run %'<CR>", {silent = true})

-- Utilities

-- vim.keymap.set("v", "<space>rl", function()
--     -- require("toggleterm").send_lines_to_terminal("single_line", trim_spaces, { args = vim.v.count })
--     require("toggleterm").send_lines_to_terminal("visual_lines", trim_spaces, { args = 1 })
-- end)

-- vim.keymap.set("n", "<leader>rl", function()
--     require("toggleterm").send_lines_to_terminal("single_line", trim_spaces, { args = 1 })
-- end)
