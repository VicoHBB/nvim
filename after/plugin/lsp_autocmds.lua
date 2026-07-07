local autocmd = vim.api.nvim_create_autocmd
local lsp_group = vim.api.nvim_create_augroup("lsp_autocmds", { clear = true })

-- LSP garbage collector (replaces garbage-day.nvim / lsp-timeout.nvim): after
-- nvim sits unfocused past the grace period, stop every enable()-managed client
-- to free RAM; focus brings them back. Names are captured at stop time so
-- servers stopped manually via :LspStop are not resurrected
local lsp_gc_grace = vim.g.lsp_gc_grace_ms or 15 * 60 * 1000
local lsp_gc_timer = assert(vim.uv.new_timer())
local lsp_gc_stopped = {}

autocmd("FocusLost", {
    group = lsp_group,
    callback = function()
        lsp_gc_timer:start(lsp_gc_grace, 0, vim.schedule_wrap(function()
            local seen, names = {}, {}
            for _, client in ipairs(vim.lsp.get_clients()) do
                if not seen[client.name] and vim.lsp.is_enabled(client.name) then
                    seen[client.name] = true
                    table.insert(names, client.name)
                end
            end
            if #names == 0 then
                return
            end
            lsp_gc_stopped = names
            vim.lsp.enable(names, false)
            -- enable(false) only requests a graceful shutdown (exit_timeout
            -- defaults to false); busy servers can linger for minutes holding
            -- their RAM, so force-kill whatever is still alive after 5s
            for _, name in ipairs(names) do
                for _, client in ipairs(vim.lsp.get_clients({ name = name })) do
                    client:stop(5000)
                end
            end
            vim.notify(('LSP -> garbage collected: %s'):format(table.concat(names, ', ')), vim.log.levels.INFO)
        end))
    end,
})

autocmd("FocusGained", {
    group = lsp_group,
    callback = function()
        lsp_gc_timer:stop()
        if #lsp_gc_stopped > 0 then
            vim.lsp.enable(lsp_gc_stopped)
            vim.notify(('LSP -> restored: %s'):format(table.concat(lsp_gc_stopped, ', ')), vim.log.levels.INFO)
            lsp_gc_stopped = {}
        end
    end,
})
