return {
    name = 'Presenterm',
    builder = function(opts)
        return {
            name = opts.name or 'Presenterm Slides',
            cmd  = { 'wezterm' },
            args = {
                'start',
                '--cwd', '.',
                '--',
                'presenterm',
                '--theme', 'gruvbox-dark',
                vim.fn.expand('%:p'),
            },
        }
    end,
    condition = { filetype = { "markdown" } },
}
