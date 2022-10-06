"let g:mapleader = "\<Space>"
"let g:maplocalleader = '\',
"leader
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<space>'<cr>
"g
nnoremap <silent> g             :<c-u>WhichKey  'g'<CR>
vnoremap <silent> g :silent <c-u> :silent WhichKeyVisual 'g'<cr>
"q
nnoremap <silent> q             :<c-u>WhichKey  'q'<CR>
vnoremap <silent> q :silent <c-u> :silent WhichKeyVisual 'q'<cr>
"f
nnoremap <silent> f             :<c-u>WhichKey  'f'<CR>
vnoremap <silent> f :silent <c-u> :silent WhichKeyVisual 'f'<cr>
"\
nnoremap <silent> \             :<c-u>WhichKey  '\'<CR>
vnoremap <silent> \ :silent <c-u> :silent WhichKeyVisual '\'<cr>
"m
nnoremap <silent> m             :<c-u>WhichKey  'm'<CR>
vnoremap <silent> m :silent <c-u> :silent WhichKeyVisual 'm'<cr>

" Create map to add keys to
let g:which_key_map_spc =  {}
let g:which_key_map_f   =  {}
let g:which_key_map_g   =  {}
let g:which_key_map_m   =  {}
" Define a separator
let g:which_key_sep = '→'

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
"highlight default link WhichKeySeperator DiffAdded
"highlight default link WhichKeyGroup     Identifier
"highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

"Leader
let g:which_key_map_spc['w']     = [ ':w',                               'Save file' ]
let g:which_key_map_spc['q']     = [ ':q',                               'Quit Neovim' ]
let g:which_key_map_spc['Q']     = [ ':q!',                              'Force Quit' ]
let g:which_key_map_spc['s']     = [ ':RG',                              'Serach Word(RG)' ]
let g:which_key_map_spc['n']     = [ ':NERDTreeFind',                    'Files project' ]
let g:which_key_map_spc['r']     = [ '<Plug>(coc-rename)',               'Rename Variable' ]
let g:which_key_map_spc[';']     = [ '$a;<ESC>',                         'Add ";" at the end' ]
let g:which_key_map_spc['rf']    = [ ':TerminatorRunFileInOutputBuffer', 'Run File' ]
let g:which_key_map_spc['rc']    = [ ':TerminatorOutputBufferClose',     'Close Output' ]
let g:which_key_map_spc['df']    = [ ':DashboardNewFile',                'Open Dashboard' ]
let g:which_key_map_spc['s']     = [ ':RG',                              'Serach Word(RG)' ]
let g:which_key_map_spc['<Tab>'] = [ ':bdelete',                         'Close File(Buffer)' ]
let g:which_key_map_spc['g']     = [ ':LazyGit',                         'LazyGit' ]
"
"f
let g:which_key_map_f['f']  = [ ':Files'                         , 'Serach Files' ]
let g:which_key_map_f['c']  = [ ':HopChar2'                      , 'Find & Move to a 2 Characters' ]
let g:which_key_map_f['l']  = [ ':HopLine'                       , 'Find & Move to a Line' ]
let g:which_key_map_f['w']  = [ ':HopWord'                       , 'Find & Move to a Word' ]
let g:which_key_map_f['zh'] = [ ':History'                      , 'FZF History' ]


"g
let g:which_key_map_g['t']   = [ ':1'                                   , 'Go to top' ]
let g:which_key_map_g['b']   = [ ':999'                                 , 'Go to bottom' ]
let g:which_key_map_g['d']   = [ '<Plug>(coc-definition)'               , 'Go to Definition' ]
let g:which_key_map_g['y']   = [ '<Plug>(coc-type-definition)'          , 'Type  definition' ]
let g:which_key_map_g['i']   = [ '<Plug>(coc-implementation)'           , 'Go to Implementation' ]
let g:which_key_map_g['r']   = [ '<Plug>(coc-references)'               , 'Go to References' ]
let g:which_key_map_g['f']   = [ ':call OpenFileInPrevWindow()'         , 'Go to File' ]
"
function! OpenFileInPrevWindow()
    let cfile = expand("<cfile>")
    wincmd p
    execute "Files " . cfile
endfunction
"
"m
let g:which_key_map_g['a']   = [ ':make'            , 'Make All' ]
let g:which_key_map_g['c']   = [ ':make clean'      , 'Make Clean' ]
let g:which_key_map_g['d']   = [ ':make debug'      , 'Make Clean' ]


" Register which key map
call which_key#register('<space>', "g:which_key_map_spc")
call which_key#register('f', "g:which_key_map_f")
call which_key#register('g', "g:which_key_map_g")
call which_key#register('m', "g:which_key_map_m")
