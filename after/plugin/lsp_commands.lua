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
            autocmd({ "CursorHold", "CursorHoldI" }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.document_highlight,
            })

            autocmd({ "CursorMoved", "CursorMovedI" }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.clear_references,
            })

            autocmd("LspDetach", {
                group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
                callback = function(event2)
                    vim.lsp.buf.clear_references()
                    vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
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

cmd('LspStart', function(info)
    local clients = info.fargs

    -- Default to servers matching the current buffer's filetype, discovered
    -- via runtime files instead of the private vim.lsp.config._configs table.
    if #clients == 0 then
        local filetype = vim.bo.filetype
        for _, path in ipairs(vim.api.nvim_get_runtime_file('lsp/*.lua', true)) do
            local name = path:match('([^/]+)%.lua$')
            if name then
                local cfg = vim.lsp.config[name]
                if cfg and cfg.filetypes and vim.tbl_contains(cfg.filetypes, filetype) then
                    table.insert(clients, name)
                end
            end
        end
    end

    if #clients == 0 then
        vim.notify('No LSP servers found for filetype: ' .. vim.bo.filetype, vim.log.levels.WARN)
        return
    end

    vim.lsp.enable(clients)
    vim.notify(('LSP -> started: %s'):format(table.concat(clients, ', ')), vim.log.levels.INFO)
    end,
    {
        desc = 'Start a language server by its configured name',
        nargs = '?',
        complete = complete_config,
    }
)

cmd('LspStop', function()
        local clients = vim.lsp.get_clients({ bufnr = 0 })
        if #clients == 0 then
            vim.notify('No active LSP clients found.', vim.log.levels.WARN)
            return
        end
        for _, client in ipairs(clients) do
            client:stop(true)
            vim.notify(('LSP -> stopped: %s'):format(client.name), vim.log.levels.INFO)
        end
    end,
    {
        desc = 'Stop all active language servers on the current buffer',
    }
)

cmd('LspRestart', function()
        local clients = vim.lsp.get_clients({ bufnr = 0 })

        if #clients == 0 then
            vim.notify('No active LSP clients found.', vim.log.levels.WARN)
            return
        end

        local names = vim.tbl_map(function(c) return c.name end, clients)
        for _, client in ipairs(clients) do client:stop() end

        -- Defer the reload to give clients time to fully stop before restarting.
        -- vim.cmd('e') retriggers FileType which causes enabled servers to reattach.
        vim.defer_fn(function()
            vim.cmd('e')
            vim.notify(('LSP -> restarted: %s'):format(table.concat(names, ', ')), vim.log.levels.INFO)
        end, 500)
    end,
    {
        desc = 'Restart LSP clients attached to the current buffer',
    }
)
