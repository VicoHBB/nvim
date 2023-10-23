return {                                                     -- Better quickfix
  {
    'kevinhwang91/nvim-bqf',
    ft = { 'qf' },
  },
  {
    "milkypostman/vim-togglelist", -- Toggle quickfix
    config = function ()
      vim.gtoggle_list_no_mappings = true
    end
  }
}
