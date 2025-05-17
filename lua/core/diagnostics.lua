local autocmd = vim.api.nvim_create_autocmd

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

-- Define Code Actions sign
vim.fn.sign_define("LspCodeActionSign",
    {
        text = "",
        texthl = "LspDiagnosticsSignHint"
    }
)

-- Function to check and place the sign
local function show_code_action_sign()
    local bufnr = vim.api.nvim_get_current_buf()
    local params = vim.lsp.util.make_range_params(0, "utf-8")
    params.context = { diagnostics = vim.diagnostic.get(bufnr) }

    -- Clear signs
    vim.fn.sign_unplace("CodeActionGroup", { buffer = bufnr })

    -- Call the LSP server to get code actions
    vim.lsp.buf_request_all(bufnr, "textDocument/codeAction", params,
        function(results)
            local has_actions = false
            for _, res in pairs(results) do
                if res.result and #res.result > 0 then
                    has_actions = true
                    break
                end
            end

            -- If there are actions, place the sign; otherwise, remove it
            if has_actions then
                vim.fn.sign_place(0, "CodeActionGroup", "LspCodeActionSign", bufnr,
                    {
                        lnum = vim.fn.line("."),
                        priority = 10
                    })
            else
                vim.fn.sign_unplace("CodeActionGroup", { buffer = bufnr })
            end
        end)
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

-- AutoCommand to update the sign when the cursor changes
autocmd({ "CursorMoved" }, {
    callback = function()
        local ft = vim.bo.filetype

        if not (ft == "systemverilog" or "verilog" == ft or "tex" == ft) then
            show_code_action_sign()
        else
        end
    end
})
