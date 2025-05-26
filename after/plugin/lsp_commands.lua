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

local complete_client = function(arg)
    return vim
        .iter(vim.lsp.get_clients())
        :map(function(client)
            return client.name
        end)
        :filter(function(name)
            return name:sub(1, #arg) == arg
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

-- Custom Command: LspStart
-- Starts a language server based on its configured name.
-- It checks if the server process is already active.
cmd('LspStart', function(info)
        local server_name = info.args -- The name of the server to start (e.g., 'pyright', 'tsserver')

        -- Get all active LSP clients to check if the server is already running
        local active_clients = vim.lsp.get_clients()
        local server_is_already_running = false
        for _, client in ipairs(active_clients) do
            if client.name == server_name then
                server_is_already_running = true
                break
            end
        end

        if server_is_already_running then
            vim.notify(("LSP '%s' running, attaching."):format(server_name), vim.log.levels.INFO)
        else
            vim.notify(("Starting LSP '%s'."):format(server_name), vim.log.levels.INFO)
        end

        -- Attempt to start/attach the LSP client.
        -- vim.lsp.start will either launch a new server or attach an existing one.
        local success, err = pcall(vim.lsp.start, { name = server_name })
        if not success then
            vim.notify(("Failed to start/attach '%s': %s"):format(server_name, err), vim.log.levels.ERROR)
        else
            vim.notify(("LSP '%s' successful."):format(server_name), vim.log.levels.INFO)
            -- Always reload the buffer after attempting to start/attach for consistency
            vim.schedule_wrap(function()
                vim.cmd('edit!')
                vim.notify("Buffer reloaded.", vim.log.levels.INFO)
            end)()
        end
    end,
    {
        desc = 'Start a language server by its configured name', -- Description for the command
        nargs = '?',                                         -- Allows the command to be called with zero or one argument
        complete = complete_config,                          -- Uses the complete_config helper for tab completion
    }
)

-- Custom Command: LspStop
-- Stops one or more specified active LSP clients.
-- It correctly terminates the client process.
cmd('LspStop', function(info)
        local clients_to_stop = {}
        local invalid_names = {}

        -- Iterate through the arguments (server names) provided by the user
        for _, name in ipairs(info.fargs) do
            local found_client = nil
            -- Find the client object by its name among all active LSP clients
            for _, client in ipairs(vim.lsp.get_clients()) do
                if client.name == name then
                    found_client = client
                    break
                end
            end

            if found_client then
                table.insert(clients_to_stop, found_client)
            else
                table.insert(invalid_names, name)
            end
        end

        if #invalid_names > 0 then
            vim.notify(("Invalid client(s): %s"):format(table.concat(invalid_names, ", ")), vim.log.levels.WARN)
        end

        if #clients_to_stop == 0 then
            vim.notify("No clients to stop.", vim.log.levels.INFO)
            return
        end


        -- Stop all selected clients.
        -- client.stop() will detach the client from all buffers and terminate its process.
        for _, client in ipairs(clients_to_stop) do
            client.stop()
        end

        vim.notify(
        ("Cliente(s) stopped: %s"):format(table.concat(
        vim.iter(clients_to_stop):map(function(c) return c.name end):totable(), ", ")), vim.log.levels.INFO)

    end,
    {
        desc = 'Stop the given client(s)', -- Description for the command
        nargs = '+',                   -- Requires one or more arguments (client names)
        complete = complete_client,    -- Uses the complete_client helper for tab completion
    }
)

-- Custom Command: LspRestart
-- Restarts one or more specified active LSP clients.
-- It directly stops and restarts clients, and reloads the current buffer.
cmd('LspRestart', function(info)
        local clients_to_restart = {}
        local invalid_names = {}

        -- Find the active client objects based on provided names
        for _, name in ipairs(info.fargs) do
            local found_client = nil
            for _, client in ipairs(vim.lsp.get_clients()) do
                if client.name == name then
                    found_client = client
                    break
                end
            end

            if found_client then
                table.insert(clients_to_restart, found_client)
            else
                table.insert(invalid_names, name)
            end
        end

        if #invalid_names > 0 then
            vim.notify(("Invalid client(s): %s"):format(table.concat(invalid_names, ", ")), vim.log.levels.WARN)
        end

        if #clients_to_restart == 0 then
            vim.notify("No clients to restart.", vim.log.levels.INFO)
            return
        end

        vim.notify(
        ("Stopping client(s) for restart: %s"):format(table.concat(
        vim.iter(clients_to_restart):map(function(c) return c.name end):totable(), ", ")), vim.log.levels.INFO)

        -- Stop all selected clients directly
        for _, client in ipairs(clients_to_restart) do
            client.stop()
        end

        -- Use a timer to introduce a small delay after stopping clients.
        -- This gives the processes time to fully terminate.
        local timer = assert(vim.uv.new_timer())
        timer:start(300, 0, function() -- Delay after stopping
            -- Reload the current buffer to ensure a clean state for LSP re-attachment.
            -- This is now handled by LspStart itself.
            -- We still ensure the call to LspStart is scheduled.
            vim.notify("Initiating client restart sequence.", vim.log.levels.INFO)

            -- Add another small delay before restarting clients.
            vim.uv.new_timer():start(300, 0, function()
                for _, client_obj in ipairs(clients_to_restart) do
                    -- Restart the client using its name.
                    -- LspStart will handle the actual start and buffer reload.
                    vim.schedule_wrap(function()
                        vim.cmd('LspStart ' .. client_obj.name)
                    end)()
                end
                timer:close() -- Close the main timer resource
            end)
        end)
    end,
    {
        desc = 'Restart the given client(s)', -- Description for the command
        nargs = '+',                      -- Requires one or more arguments (client names)
        complete = complete_client,       -- Uses the complete_client helper for tab completion
    }
)
