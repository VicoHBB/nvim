""""""""""""""""""""""""LaTex
filetype plugin indent on
 "Viewer options: One may configure the viewer either by specifying a built-in
 "viewer method:
let g:vimtex_view_method = 'zathura'

 "Or with a generic interface:
"let g:vimtex_view_general_viewer = 'okular'
"let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

 "VimTeX uses latexmk as the default compiler backend. If you use it, which is
 "strongly recommended, you probably don't need to configure anything. If you
 "want another compiler backend, you can change it as follows. The list of
 "supported backends and further explanation is provided in the documentation,
 "see ":help vimtex-compiler".
"let g:vimtex_compiler_method = 'latexrun'
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-pdf',
    \   '-pdflatex="xelatex --shell-escape %O %S"',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \   '-translate-file=cp227.tcx',
    \ ]
    \}
let g:vimtex_syntax_packages = {'minted': {'load': 2}}
