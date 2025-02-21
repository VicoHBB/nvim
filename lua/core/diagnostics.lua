local signs = {
  Error = " ",
  Warn = " ",
  Hint = "󰌶 ",
  Info = " ",
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
  local params = vim.lsp.util.make_range_params()
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
  signs = true,
  underline = true,        -- Sube líneas para los diagnósticos
  update_in_insert = true, -- No actualiza diagnósticos en modo insert
  severity_sort = true,    -- Ordena los diagnósticos por severidad
})

-- AutoCommand to update the sign when the cursor changes
vim.api.nvim_create_autocmd({ "CursorMoved" }, {
  callback = function()
    local ft = vim.bo.filetype

    if ft == "systemverilog" or "verilog" == ft  then
      return  -- Disable for this
    else
      show_code_action_sign()
    end

    end
})
