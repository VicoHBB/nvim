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

keyset("n", "<F9>", "<CMD>REPL<CR> name='REPL'", { silent = true })
keyset("n", "<F10>", "<CMD>2TermExec cmd='dofile(%)'<CR>", { silent = true })

-- Utilities

keyset("v", "<space>r", function()
    -- require("toggleterm").send_lines_to_terminal("single_line", trim_spaces, { args = vim.v.count })
    require("toggleterm").send_lines_to_terminal("visual_lines", trim_spaces, { args = 1 })
end)


keyset("n", "<leader>r", function()
    require("toggleterm").send_lines_to_terminal("single_line", trim_spaces, { args = 1 })
end)

