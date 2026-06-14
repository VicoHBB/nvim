return {
    name = 'WaveView',
    builder = function(opts)
        local current_dir = vim.fn.expand('%:h')
        local base_name   = vim.fn.fnamemodify(vim.fn.expand('%'), ':t:r')
        local image_path  = current_dir .. '/img/' .. base_name .. '.png'

        return {
            name = opts.name or 'Wave Viewer',
            cmd  = { 'feh' },
            args = { image_path },
        }
    end,
    condition = { filetype = { "json" } },
}
