return {
    name = 'LuaRunFile',
    builder = function(opts)
        return {
            name = opts.name or 'Run File',
            cmd  = { 'lua' },
            args = { vim.fn.expand('%') },
        }
    end,
    condition = { filetype = { "lua" } },
}
