return {
    name = 'ViewPDF',
    builder = function(opts)
        return {
            name = opts.name or 'View file in Zathura',
            cmd  = { 'zathura' },
            args = { vim.fn.expand('%:p:r') .. '.pdf' },
        }
    end,
    condition = { filetype = { "markdown" } },
}
