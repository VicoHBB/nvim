return {
    name = 'Pandoc',
    builder = function(opts)
        return {
            name = opts.name or 'Convert file to PDF',
            cmd  = { 'pandoc' },
            args = {
                vim.fn.expand('%:p'),
                '-o',
                vim.fn.expand('%:p:r') .. '.pdf',
                '--template', 'eisvogel',
                '--syntax-highlighting', 'idiomatic',
            },
        }
    end,
    condition = { filetype = { "markdown" } },
}
