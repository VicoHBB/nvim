return {
    name = 'UVTest',
    builder = function(opts)
        return {
            name = opts.name or 'pytest',
            cmd  = { 'uv' },
            args = { 'run', 'pytest' },
            -- pytest's failure location (`path:line: Error`) as a qf error (%E); the rest stays as text
            default_component_params = {
                errorformat = [[%E%f:%l: %m]]
            },
        }
    end,
    condition = { filetype = { "python" } },
}
