return {
  'erietz/vim-terminator',                                        -- Terminator
  -- This will be use just for lint and build
  config = function()
    vim.cmd([[
      let g:terminator_runfile_map = {
                  \ "javascript": "node",
                  \ "python": "python -u",
                  \ "c": "make all &&",
                  \ "rust": "rustc $dir$fileName && ./$fileNameWithoutExt",
                  \ "verilog_systemverilog": "make all &&",
                  \ "d2": "d2 --layout=elk -t 200 $dir$fileName DIMG/$fileNameWithoutExt.png && gwenview DIMG/$fileNameWithoutExt.png"
                  \ }
    ]])

    vim.cmd([[
      let g:terminator_repl_command = {
        \'python' : 'ipython --no-autoindent',
        \'javascript': 'node',
        \}
    ]])

    vim.g.terminator_split_fraction = 0.2

  end,
}
