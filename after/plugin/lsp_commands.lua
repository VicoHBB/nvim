local autocmd = vim.api.nvim_create_autocmd
local cmd = vim.api.nvim_create_user_command


local complete_config = function(arg)
    return vim
        .iter(vim.api.nvim_get_runtime_file(('lsp/%s*.lua'):format(arg), true))
        :map(function(path)
            local file_name = path:match('[^/]*.lua$')
            return file_name:sub(0, #file_name - 4)
        end)
        :totable()
end

autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
    callback = function(event)
        -- The following two autocommands are used to highlight references of the
        -- word under your cursor when your cursor rests there for a little while.
        --    See `:help CursorHold` for information about when this is executed
        --
        -- When you move your cursor, the highlights will be cleared (the second autocommand).
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
            local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd("LspDetach", {
                group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
                callback = function(event2)
                    vim.lsp.buf.clear_references()
                    vim.api.nvim_clear_autocmds({ group = "kickstart-slp-highlight", buffer = event2.buf })
                end,
            })
        end
    end
})

-- autocmd("LspAttach", {
--     group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
--     callback = function ()
--     end
-- })

cmd("LspInfo", function()
        vim.cmd("checkhealth vim.lsp")
    end,
    {
        desc = "Alias of ':checkhealth vim.lsp'"
    }
)

-- @TODO: Is not working properly the following code:

cmd('LspStart', function(info)
    local clients = info.fargs

    -- Default to enabling all servers matching the filetype of the current buffer.
    -- This assumes that they've been explicitly configured through `vim.lsp.config`,
    -- otherwise they won't be present in the private `vim.lsp.config._configs` table.
    if #clients == 0 then
      local filetype = vim.bo.filetype
      for name, _ in pairs(vim.lsp.config._configs) do
        local filetypes = vim.lsp.config[name].filetypes
        if filetypes and vim.tbl_contains(filetypes, filetype) then
          table.insert(clients, name)
        end
      end
    end

    vim.lsp.enable(clients)
    vim.notify(('LSP -> %s started.'):format(table.concat(clients, ', ')), vim.log.levels.INFO)
    end,
    {
        desc = 'Start a language server by its configured name',
        nargs = '?',
        complete = complete_config,
    }
)

cmd('LspStop', function()
        local clients = vim.lsp.get_clients()
        vim.lsp.stop_client(clients, true)
        for _, client in ipairs(clients) do
            vim.notify(('LSP -> %s stopped.'):format(client.name), vim.log.levels.INFO)
        end
    end,
    {
        desc = 'Stop all active language servers',
    }
)

cmd('LspRestart', function()
        local clients = vim.lsp.get_clients()

        if #clients == 0 then
            vim.notify('No active LSP clients found.', vim.log.levels.WARN)
        else
            vim.notify('Restarting LSP clients...', vim.log.levels.INFO)
            vim.lsp.stop_client(clients)
            vim.cmd('e') -- use insted of e! to avoid lost changes
            for _, client in ipairs(clients) do
                -- @TODO: check how to fix this
                -- vim.lsp.enable(client.name)
                vim.notify(('LSP -> %s restarted.'):format(client.name), vim.log.levels.INFO)
            end
        end

    end,
    {
        desc = 'Restart the given client(s)', -- Description for the command
    }
)
