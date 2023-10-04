return {
  {                                                                  -- SystemVerilog
    "vhda/verilog_systemverilog.vim",
    lazy = true,
    ft = { "verilog", "systemverilog" },
    config = function()
      vim.g.verilog_indent_modules = 1
    end,
    keys = { }
  },
  {                                                                  -- SV Instance
    "antoinemadec/vim-verilog-instance",
    lazy = true,
    ft = { "verilog", "systemverilog" },
    config = function()
      -- When the variable is 1, last printed line will skip the coma. Default value is 0.
      vim.g.verilog_instance_skip_last_coma = 1
      -- When the variable is 1, comments will be kept (block comments /* */ not support!). Default value is 0.
      vim.g.verilog_instance_keep_comments = 1
      -- When the variable is 1, empty lines in your code will be printed. Default value is 0.
      vim.g.verilog_instance_keep_empty_lines = 0
	  end,
  },
}
