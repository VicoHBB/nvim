lua << EOF

require('telescope').load_extension('media_files')
require("telescope").load_extension('zoxide')
require('telescope').load_extension('coc')

require'telescope'.setup {
    defaults= {
        layout_config = {
            horizontal = {
                preview_cutoff = 0,
                },
        },
    },
    extensions = {
            media_files = {
                -- filetypes whitelist
                -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
                filetypes = {"png", "webp", "jpg", "jpeg"},
                find_cmd = "rg" -- find command (defaults to `fd`)
            },
            zoxide = {
                prompt_title = "[ Walking on the shoulders of TJ ]",
            },
            coc = {
                theme = 'ivy',
                prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
            },
    },
}

EOF
