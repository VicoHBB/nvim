local icons = {
    [vim.diagnostic.severity.ERROR] = { text = " ",  hl = "DiagnosticSignError" },
    [vim.diagnostic.severity.WARN]  = { text = " ",  hl = "DiagnosticSignWarn"  },
    [vim.diagnostic.severity.INFO]  = { text = " ",  hl = "DiagnosticSignInfo"  },
    [vim.diagnostic.severity.HINT]  = { text = "󰌶 ", hl = "DiagnosticSignHint"  },
}

vim.diagnostic.config({
    virtual_text = true,
    signs = {
        text = vim.tbl_map(function(v) return v.text end, icons),
    },
    underline = true,
    severity_sort = true,
    float = {
        border = "rounded",
        source = true,
        header = "",
        prefix = function(diagnostic)
            local icon = icons[diagnostic.severity] or { text = "", hl = "" }
            return icon.text, icon.hl
        end,
    }
})
