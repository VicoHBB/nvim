return {
    name = 'UVenv',
    builder = function(opts)
        return {
            name = opts.name or 'Init venv',
            cmd  = { 'uv' },
            args = { 'venv' },
        }
    end,
    condition = { filetype = { "python" } },
}
