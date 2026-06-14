return {
    name = 'UVTest',
    builder = function(opts)
        return {
            name = opts.name or 'pytest',
            cmd  = { 'uv' },
            args = { 'run', 'pytest' },
        }
    end,
    condition = { filetype = { "python" } },
}
