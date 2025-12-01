return {
    "vhda/verilog_systemverilog.vim",
    enabled = Is_Not_Win32,
    ft = { "verilog", "systemverilog" },
    config = function()
        -- Force legacy syntax ON. Tree-sitter disables it by default, but
        -- 'GetVerilogIndent' relies on regex syntax groups to work correctly when plugin starts.
        vim.bo.syntax = "systemverilog"
        vim.bo.indentexpr = "GetVerilogIndent()"
        vim.g.verilog_indent_modules = 1
    end,
    keys = {
        {
            "<leader>V",
            function()
                vim.cmd("VerilogErrorFormat Verilator 1")
            end,
            mode = { 'n' },
            ft = { "verilog", "systemverilog" },
            noremap = true,
            silent = true,
            desc = "Set Verilator Error format",
        },
        {
            "gi",
            function()
                vim.cmd("VerilogFollowInstance")
                vim.cmd("normal zz")
            end,
            mode = { 'n' },
            ft = { "verilog", "systemverilog" },
            noremap = true,
            silent = true,
            desc = "Follow Instance"
        },
        {
            "gp",
            function()
                vim.cmd("VerilogFollowPort")
                vim.cmd("normal zz")
            end,
            mode = { 'n' },
            ft = { "verilog", "systemverilog" },
            noremap = true,
            silent = true,
            desc = "Follow Port"
        },
        {
            "g(",
            function()
                vim.cmd("VerilogGotoInstanceStart")
                vim.cmd("normal zz")
            end,
            mode = { 'n' },
            ft = { "verilog", "systemverilog" },
            noremap = true,
            silent = true,
            desc = "Go to Instance Start"
        }
    }
}
