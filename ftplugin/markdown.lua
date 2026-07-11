-- ============================================================================
-- Local variables
-- ============================================================================
local keyset = vim.keymap.set

-- Buffer options live in the prose-like FileType autocmd of core/autocmds.lua

-- ============================================================================
-- Keymaps
-- ============================================================================

keyset( 'n', "||",
  function ()
    vim.cmd("normal vip")
    vim.cmd("normal ga |")
    vim.notify("Table Aligned",vim.log.levels.INFO)
  end,
  {
    buffer = 0,
    noremap = true,
    silent= true,
    desc = "Align Table(Need to check)"
  }
)

keyset( 'v', "||",
  function ()
    vim.cmd("normal ga |")
    vim.notify("Table Aligned",vim.log.levels.INFO)
  end,
  {
    buffer = 0,
    noremap = true,
    silent= true,
    desc = "Align Table(Need to check)"
  }
)
