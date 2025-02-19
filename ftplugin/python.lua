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
vim.bo.autoindent  = true

-- ============================================================================
-- Autocommands
-- ============================================================================

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

keyset("v", "<space>rl", function()
    -- require("toggleterm").send_lines_to_terminal("single_line", trim_spaces, { args = vim.v.count })
    require("toggleterm").send_lines_to_terminal("visual_lines", trim_spaces, { args = 1 })
  end,
  {
    buffer = 0,
    noremap = true,
    silent = true,
    desc = "Run lines on REPL",
  }
)

keyset("n", "<leader>rl", function()
    require("toggleterm").send_lines_to_terminal("single_line", trim_spaces, { args = 1 })
  end,
  {
    buffer = 0,
    noremap = true,
    silent = true,
    desc = "Run lines on REPL",
  }
)

-- Utilities
