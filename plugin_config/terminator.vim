let g:terminator_runfile_map = {
            \ "javascript": "node",
            \ "python": "python -u",
            "\ "c": "gcc $dir$fileName -o $dir$fileNameWithoutExt && $dir$fileNameWithoutExt",
            \ "c": "stat $dir$fileName && make all",
            \ "rust": "rustc $dir$fileName && ./$fileNameWithoutExt",
            \ "verilog_systemverilog": "stat $dir$fileName && clear && make lint",
            \ "d2": "d2 -t 200 $dir$fileName $fileNameWithoutExt.png && feh -Z $fileNameWithoutExt.png"
            \ }

let g:terminator_repl_command = {
  \'python' : 'ipython --no-autoindent',
  \'javascript': 'node',
  \}

let g:terminator_split_fraction = 0.2
