return {
  "vhda/verilog_systemverilog.vim",
  enabled = true,
  ft = { "verilog", "systemverilog" },
  config = function()
    vim.g.verilog_indent_modules = 1
  end,
  keys = {
    {
      "<leader>V",
      function ()
        vim.cmd("VerilogErrorFormat Verilator 1")
      end,
      mode = { 'n' },
      ft = { "verilog", "systemverilog" },
      noremap = true,
      silent= true,
      desc = "Set Verilator Error format",
    },
    {
      "gi",
      function ()
        vim.cmd("VerilogFollowInstance")
        vim.cmd("normal zz")
      end,
      mode = { 'n' },
      ft = { "verilog", "systemverilog" },
      noremap = true,
      silent= true,
      desc = "Follow Instance"
    },
    {
      "gp",
      function ()
        vim.cmd("VerilogFollowPort")
        vim.cmd("normal zz")
      end,
      mode = { 'n' },
      ft = { "verilog", "systemverilog" },
      noremap = true,
      silent= true,
      desc = "Follow Port"
    },
    {
      "g(",
      function ()
        vim.cmd("VerilogGotoInstanceStart")
        vim.cmd("normal zz")
      end,
      mode = { 'n' },
      ft = { "verilog", "systemverilog" },
      noremap = true,
      silent= true,
      desc = "Go to Instance Start"
    }
  }
}
