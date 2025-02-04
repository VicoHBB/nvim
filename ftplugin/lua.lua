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

-- ============================================================================
-- Keymaps
-- ============================================================================

-- Compilation & Simulation

keyset("n", "<F9>", "<CMD>TermExec cmd='dofile(\"%\")'<CR>", {
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

-- keyset("v", "<space>rl", function()
--     -- require("toggleterm").send_lines_to_terminal("single_line", trim_spaces, { args = vim.v.count })
--     require("toggleterm").send_lines_to_terminal("visual_lines", trim_spaces, { args = 1 })
--   end,
--   {
--     buffer = 0,
--     noremap = true,
--     silent = true,
--     desc = "Run lines on REPL",
--   }
-- )

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
keyset('n', '<leader>O', '<CMD>Lspsaga outline<CR>', {
  buffer = 0,
  noremap = true,
  silent= true,

  desc = "Outline symbols",
})
