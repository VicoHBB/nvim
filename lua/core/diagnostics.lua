local signs = {
    Error = " ",
    Warn = " ",
    Hint = "󰌶 ",
    Info = " ",
}

local severity_to_sign = {
    [vim.diagnostic.severity.ERROR] = {
        sign = signs.Error,
        hl_group = "DiagnosticSignError"
    },
    [vim.diagnostic.severity.WARN]  = {
        sign = signs.Warn,
        hl_group = "DiagnosticSignWarn"
    },
    [vim.diagnostic.severity.INFO]  = {
        sign = signs.Info,
        hl_group = "DiagnosticSignInfo"
    },
    [vim.diagnostic.severity.HINT]  = {
        sign = signs.Hint,
        hl_group = "DiagnosticSignHint"
    }
}

-- Define sings
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Configura la apariencia de los diagnósticos
vim.diagnostic.config({
    virtual_text = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN]  = " ",
            [vim.diagnostic.severity.INFO]  = "󰌶 ",
            [vim.diagnostic.severity.HINT]  = " "
        }
    },
    underline = true,
    update_in_insert = true,
    severity_sort = true,
    float = {
        border = "rounded",
        source = true,
        header = "",
        prefix = function(diagnostic)
            local severity = severity_to_sign[diagnostic.severity] or {
                sign = "",
                hl_group = ""
            }
            return severity.sign, severity.hl_group
        end,
    }
})
