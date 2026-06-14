return {
    name = 'UVRunFile',
    builder = function(opts)
        return {
            name = opts.name or 'Run File',
            cmd  = { 'uv' },
            args = { 'run', vim.fn.expand('%') },
        }
    end,
    condition = { filetype = { "python" } },
}
