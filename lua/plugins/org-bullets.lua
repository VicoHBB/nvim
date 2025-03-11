return {
  'akinsho/org-bullets.nvim',
  enabled = true,
  ft = { 'org' },
  config = function()
    -- setup required
    require('org-bullets').setup()
  end
}
