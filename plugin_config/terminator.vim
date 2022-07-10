let g:terminator_runfile_map = {
            \ "javascript": "node",
            \ "python": "python -u",
            \ "c": "gcc $dir$fileName -o $dir$fileNameWithoutExt && $dir$fileNameWithoutExt",
						\ "rust": "rustc $dir$fileName && ./$fileNameWithoutExt"
            \ }

let g:terminator_repl_command = {
  \'python' : 'ipython --no-autoindent',
  \'javascript': 'node',
  \}

            "\ "c": "gcc $dir$fileName -o $dir$fileNameWithoutExt && cppcheck --addon=misra.json --template=gcc --inline-suppr --force --std=c99 --quiet $dir && $dir$fileNameWithoutExt",
