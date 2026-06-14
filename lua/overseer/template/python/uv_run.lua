return {
    name = 'UVRun',
    builder = function(opts)
        return {
            name = opts.name or 'Run UV Project',
            cmd  = { 'uv' },
            args = { 'run', 'src/main.py' },
        }
    end,
    condition = { filetype = { "python" } },
}
