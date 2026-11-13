return {
    name = 'UVRunFile',
    builder = function(opts)
        return {
            name = opts.name or 'Run File',
            cmd  = { 'uv' },
            args = { 'run', vim.fn.expand('%') },
            -- One qf error (%E) per traceback frame (text = function name); code, carets and exception stay as text
            default_component_params = {
                errorformat = [[%E%\s%#File "%f"\, line %l\, in %m,%E%\s%#File "%f"\, line %l]]
            },
        }
    end,
    condition = { filetype = { "python" } },
}
