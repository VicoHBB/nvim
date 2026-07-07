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

local complete_active = function()
    return vim.tbl_map(function(c) return c.name end, vim.lsp.get_clients())
end

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

cmd('LspStop', function(info)
        local names = info.fargs
        if #names == 0 then
            names = vim.tbl_map(function(c) return c.name end, vim.lsp.get_clients({ bufnr = 0 }))
        end

        if #names == 0 then
            vim.notify('No active LSP clients found.', vim.log.levels.WARN)
            return
        end

        -- enable(false) disables the config besides stopping the client, so the
        -- server stays down instead of reattaching on the next FileType event
        for _, name in ipairs(names) do
            vim.lsp.enable(name, false)
            if info.bang then
                for _, client in ipairs(vim.lsp.get_clients({ name = name })) do
                    client:stop(true)
                end
            end
        end

        vim.notify(('LSP -> stopped: %s'):format(table.concat(names, ', ')), vim.log.levels.INFO)
    end,
    {
        desc = 'Stop the language servers on the current buffer (! = force kill)',
        nargs = '*',
        bang = true,
        complete = complete_active,
    }
)

cmd('LspRestart', function(info)
        local names = info.fargs
        if #names == 0 then
            names = vim.tbl_map(function(c) return c.name end, vim.lsp.get_clients())
        end

        if #names == 0 then
            vim.notify('No active LSP clients found.', vim.log.levels.WARN)
            return
        end

        for _, name in ipairs(names) do
            vim.lsp.enable(name, false)
            if info.bang then
                for _, client in ipairs(vim.lsp.get_clients({ name = name })) do
                    client:stop(true)
                end
            end
        end

        -- Re-enable once the clients had time to exit; enable() reattaches to every
        -- matching buffer without reloading it
        local timer = assert(vim.uv.new_timer())
        timer:start(500, 0, vim.schedule_wrap(function()
            timer:close()
            vim.lsp.enable(names)
            vim.notify(('LSP -> restarted: %s'):format(table.concat(names, ', ')), vim.log.levels.INFO)
        end))
    end,
    {
        desc = 'Restart all active language servers (! = force kill)',
        nargs = '*',
        bang = true,
        complete = complete_active,
    }
)
