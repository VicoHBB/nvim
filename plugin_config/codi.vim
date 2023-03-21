
"Codi
" Change the color
highlight CodiVirtualText guifg=cyan

let g:codi#virtual_text_prefix = "❯ "

let g:codi#interpreters = {
     \ 'python': {
         \ 'bin': 'python',
         \ 'prompt': '^\(>>>\|\.\.\.\) ',
         \ },
     \ }
"
let g:codi#aliases = {
                   \ 'javascript.jsx': 'javascript',
                   \ }
