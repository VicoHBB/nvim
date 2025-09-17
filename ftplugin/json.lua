-- ============================================================================
-- Local variables
-- ============================================================================
local keyset   = vim.keymap.set
local overseer = require('overseer')

-- ============================================================================
-- Buffer variables
-- ============================================================================
vim.bo.tabstop     = 2
vim.bo.softtabstop = 3
vim.bo.expandtab   = true
vim.bo.shiftwidth  = 2
vim.wo.colorcolumn = "80"
vim.bo.autoindent  = true
vim.opt_local.wrap = true

-- ============================================================================
-- Overseer Tasks
-- ============================================================================

-- Create WaveDrom and View Image
overseer.register_template({
    name = 'WaveDrom', -- Nombre actualizado para reflejar la nueva acción
    builder = function(opts)
        local current_file_full_path = vim.fn.expand('%')
        local current_file_dir = vim.fn.expand('%:h')
        local base_name_no_ext = vim.fn.fnamemodify(current_file_full_path, ':t:r')
        local output_filename = current_file_dir .. '/img/' .. base_name_no_ext .. '.png'
        local output_dir = current_file_dir .. '/img'

        -- Comando para asegurar que el directorio img/ exista,
        -- luego generar el PNG, y finalmente abrirlo con viewnior.
        -- Usamos vim.fn.shellescape para manejar correctamente nombres con espacios o caracteres especiales.
        local command_string = string.format(
            "mkdir -p %s && wavedrom-cli -i %s -p %s ",
            vim.fn.shellescape(output_dir),
            vim.fn.shellescape(current_file_full_path),
            vim.fn.shellescape(output_filename)
        )

        return {
            name = opts.name or 'Generate Wave',
            cmd = { 'sh' }, -- Usamos 'sh' (o 'bash') para ejecutar la cadena de comandos
            args = {
                '-c',          -- Opción de sh para ejecutar el siguiente string como un comando
                command_string -- La cadena de comandos que construimos
            },
        }
    end,
    condition = {
        filetype = { "json" }
    }
})

-- View Signals with feh
overseer.register_template({
    name = 'WaveView',
    builder = function(opts)
        local current_file_full_path = vim.fn.expand('%')
        local current_file_dir = vim.fn.expand('%:h')
        local base_name_no_ext = vim.fn.fnamemodify(current_file_full_path, ':t:r')

        -- Asume que la imagen está en img/ con el mismo nombre base
        local image_to_open = current_file_dir .. '/img/' .. base_name_no_ext .. '.png'

        return {
            name = opts.name or 'Wave Viewer',
            cmd = { 'feh' }, -- Comando directo a feh
            args = {
                image_to_open  -- La ruta al archivo de imagen
            },
            metadata = { -- Opcional
                category = "WaveDrom",
                action = "view"
            }
        }
    end,
    condition = {
        filetype = { "json" } -- Se activa para archivos JSON, asumiendo que quieres ver la imagen asociada
    }
})
