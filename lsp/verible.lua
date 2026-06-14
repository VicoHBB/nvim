---@brief
---
--- https://github.com/chipsalliance/verible
---
--- A linter and formatter for verilog and SystemVerilog files.
---
--- Release binaries can be downloaded from [here](https://github.com/chipsalliance/verible/releases)
--- and placed in a directory on PATH.
---
--- See https://github.com/chipsalliance/verible/tree/master/verilog/tools/ls/README.md for options.
return {
    cmd = {
        'verible-verilog-ls',
        '--rules_config_search',
        '--indentation_spaces=4',
        '--column_limit=120',
        '--lsp_enable_hover',
        '--variables_in_outline=true'
    },
    filetypes = { 'systemverilog', 'verilog' },
    root_markers = {
        'verible.filelist',
        {
            '.rules.verible_lint',
            '.git'
        }      -- fallback de igual peso
    },
}
