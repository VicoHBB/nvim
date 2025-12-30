-- ============================================================================
-- Local variables
-- ============================================================================
local keyset       = vim.keymap.set
local overseer     = require('overseer')

-- ============================================================================
-- Buffer variables
-- ============================================================================
vim.bo.tabstop     = 2
vim.bo.softtabstop = 2
vim.bo.expandtab   = true
vim.bo.shiftwidth  = 2
vim.wo.colorcolumn = "120"
vim.opt_local.wrap = false

-- ============================================================================
-- Autocommands
-- ============================================================================
-- -- @TODO: Check why this is happening
-- -- Guard to prevent multiple registrations
if vim.g.markdown_overseer_templates_registered then
    return
end
vim.g.markdown_overseer_templates_registered = true


-- ============================================================================
-- Overseer Tasks
-- ============================================================================

-- Run UV project
overseer.register_template({
    name = 'Presenterm',
    builder = function(opts)
        return {
            -- wezterm start --cwd . -- presenterm --theme gruvbox-dark main.md
            name = opts.name or 'Presenterm Slides',
            cmd = { 'wezterm' },
            args = {
                'start',
                '--cwd', '.',
                '--',
                'presenterm',
                '--theme', 'gruvbox-dark',
                vim.fn.expand('%:p')
            }
        }
    end,
    condition = {
        filetype = { "markdown" }
    }
})

overseer.register_template({
    name = 'Pandoc',
    builder = function(opts)
        return {
            -- pandoc document.md -o example.pdf --template eisvogel --syntax-highlighting idiomatic
            name = opts.name or 'Conver file to PDF',
            cmd = { 'pandoc' },
            args = {
                vim.fn.expand('%:p'),
                '-o',
                vim.fn.expand('%:p:r') .. '.pdf',
                '--template', 'eisvogel',
                '--syntax-highlighting', 'idiomatic'
            }
        }
    end,
    condition = {
        filetype = { "markdown" }
    }
})

overseer.register_template({
    name = 'ViewPDF',
    builder = function(opts)
        return {
            name = opts.name or 'View file in Zathura',
            cmd = { 'zathura' },
            args = {
                vim.fn.expand('%:p:r') .. '.pdf'
            },
        }
    end,
    condition = {
        filetype = { "markdown" }
    }
})

-- ============================================================================
-- Keymaps
-- ============================================================================

keyset( 'n', "||",
  function ()
    vim.cmd("normal vip")
    vim.cmd("normal ga |")
    vim.notify("Table Aligned",vim.log.levels.INFO)
  end,
  {
    buffer = 0,
    noremap = true,
    silent= true,
    desc = "Align Table(Need to check)"
  }
)

keyset( 'v', "||",
  function ()
    vim.cmd("normal ga |")
    vim.notify("Table Aligned",vim.log.levels.INFO)
  end,
  {
    buffer = 0,
    noremap = true,
    silent= true,
    desc = "Align Table(Need to check)"
  }
)

keyset(
    'n',
    "\\t",
    "0120lbi<CR><ESC>0",
    {
        buffer = 0,
        noremap = true,
        silent = true,
        desc = "Limit text to 120 columns"
    }
)
