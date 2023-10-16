return {
  'nfrid/markdown-togglecheck',
  dependencies = { 'nfrid/treesitter-utils' },
  ft = { 'markdown' },
  config = function()
    require('markdown-togglecheck').setup({
      -- create empty checkbox on item without any while toggling
      create = true,
      -- remove checked checkbox instead of unckecking it while toggling
      remove = false,
    })
    -- toggle checked / create checkbox if it doesn't exist
    vim.keymap.set('n', '<leader>x', require('markdown-togglecheck').toggle, { desc = 'Toggle Checkmark' });
    -- toggle checkbox (it doesn't remember toggle state and always creates [ ])
    vim.keymap.set('n', '<leader>X', require('markdown-togglecheck').toggle_box, { desc = 'Toggle Checkbox' });
  end,
}
