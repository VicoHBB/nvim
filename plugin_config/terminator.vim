let g:terminator_runfile_map = {
            \ "javascript": "node",
            \ "python": "python -u",
            \ "c": "make &&",
            \ "rust": "rustc $dir$fileName && ./$fileNameWithoutExt",
            \ "verilog_systemverilog": "make lint",
            \ "d2": "d2 --layout=elk -t 200 $dir$fileName DIMG/$fileNameWithoutExt.png && gwenview DIMG/$fileNameWithoutExt.png"
            \ }

let g:terminator_repl_command = {
  \'python' : 'ipython --no-autoindent',
  \'javascript': 'node',
  \}

let g:terminator_split_fraction = 0.2

"\ "c": "gcc $dir$fileName -o $dir$fileNameWithoutExt && $dir$fileNameWithoutExt",
" \ "c": "stat $dir$fileName && make all",
