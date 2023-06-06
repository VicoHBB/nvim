return {
  "kevinhwang91/rnvimr",                                          -- Ranger
  config = function()
    -- Make Ranger to be hidden after picking a file
    vim.g.rnvimr_enable_picker = 1
    -- Add a shadow window, value is equal to 100 will disable shadow
    vim.g.rnvimr_shadow_winblend = 70
    -- Draw border with both
    vim.g.rnvimr_ranger_cmd = { 'ranger', '--cmd=set draw_borders both' }

    vim.cmd[[
      " Map Rnvimr action
      let g:rnvimr_action = {
		  \ '<C-t>': 'NvimEdit tabedit',
		  \ '<C-x>': 'NvimEdit split',
		  \ '<C-v>': 'NvimEdit vsplit',
		  \ 'gw': 'JumpNvimCwd',
		  \ 'yw': 'EmitRangerCwd'
		  \ }
    ]]
  end,
}
