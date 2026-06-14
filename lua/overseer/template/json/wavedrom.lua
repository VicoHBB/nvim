return {
    name = 'WaveDrom',
    builder = function(opts)
        local current_file  = vim.fn.expand('%')
        local current_dir   = vim.fn.expand('%:h')
        local base_name     = vim.fn.fnamemodify(current_file, ':t:r')
        local output_dir    = current_dir .. '/img'
        local output_file   = output_dir .. '/' .. base_name .. '.png'

        local cmd = string.format(
            "mkdir -p %s && wavedrom-cli -i %s -p %s",
            vim.fn.shellescape(output_dir),
            vim.fn.shellescape(current_file),
            vim.fn.shellescape(output_file)
        )

        return {
            name = opts.name or 'Generate Wave',
            cmd  = { 'sh' },
            args = { '-c', cmd },
        }
    end,
    condition = { filetype = { "json" } },
}
