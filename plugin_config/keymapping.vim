"""""""""""""""""""""""""""""""""""""""""""""""Keymaps
"Tecla lider ESPACIO
let mapleader=" "
nmap <silent><leader>         <Cmd>echo 'What to do?'<CR>
nmap <silent><leader><leader> <Cmd>echo 'Think'<CR>

"''''''''''''''''''''''''''''''''''''''''''''''COC
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
"nmap <silent> gd <Plug>('jumpDefinition','tab drop')<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>r <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap qf <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""" goto-preview
nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>
nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>
nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>
" Only set if you have telescope installed
nnoremap gpr <cmd>lua require('goto-preview').goto_preview_references()<CR>

""""""""""""""""""""""""""""" Easymotion
"nmap fc  <Plug>(easymotion-s2)
""""""""""""""""""""""""""""" Hop
nmap fc  :HopChar2<CR>
nmap fw  :HopWord<CR>
nmap fl  :HopLine<CR>
nmap ?   :HopPattern<CR>

"""""""""""""""""""""""""" NERDTreeF
nmap <Leader>n :NERDTreeFind<CR>

""""""""""""""""""""""""""""" Ranger
let g:ranger_map_keys = 0
map  F :RnvimrToggle<CR>

""""""""""""""""""""""""""""" Atajos de comandos basicos
nmap <Leader>w :w<CR>

""""""""""""""""""""""""""""" Fast exit 
nmap <Leader>q :q<CR>
nmap <Leader>Q :q!<CR>

""""""""""""""""""""""""""""" Split resize 
nnoremap <Leader>> 10<C-w>>
nnoremap <Leader>< 10<C-w><
""""""""""""""""""""""""""""" Fast ";"
nnoremap <Leader>; $a;<Esc>

"""""""""""""""""""""""""""""" Airline and tabs
nmap <Tab>         :bnext<CR>
nmap <S-Tab>       :bprevious<CR>
nmap <Leader><Tab> :bdelete<CR>

"""""""""""""""""""""""""""""" Tmux
nnoremap <silent> <C-h>   :TmuxNavigateLeft  <CR>
nnoremap <silent> <C-j>   :TmuxNavigateDown  <CR>
nnoremap <silent> <C-k>   :TmuxNavigateUp    <CR>
nnoremap <silent> <C-l>   :TmuxNavigateRight <CR>
nnoremap <silent> <C-p>   :TmuxNavigatePrevious <CR>

"""""""""""""""""""""""""""""" Faster scrolling
nnoremap <silent> <C-Down>  10j
nnoremap <silent> <C-Up>    10k

""""""""""""""""""""""""""""""" Signify 
"nnoremap <silent>     <F12>  :SignifyToggle<CR>
"See changes
nnoremap <silent>     <F6>  :SignifyHunkDiff<CR>
nnoremap <silent>     <F7>   :SignifyToggleHighlight<CR>
"nnoremap <silent>     <F6>   :SignifyDiff<CR>

"""""""""""""""""""""""""""""" FZF
"nnoremap <silent>  ff         :Files<CR>
nnoremap <silent>  <Leader>l :Lines<CR>
nnoremap <silent>  <Leader>s :Rg<CR>
nnoremap fzh <cmd>History<CR>

"""""""""""""""""""""""""""""" Floatterm
nmap   	   <silent>   <F2>    :FloatermNew<CR>
tnoremap   <silent>   <F2>    <C-\><C-n>:FloatermNew<CR>
nnoremap   <silent>   <F3>    :FloatermPrev<CR>
tnoremap   <silent>   <F3>    <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent>   <F4>    :FloatermNext<CR>
tnoremap   <silent>   <F4>    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <F1>    :FloatermToggle<CR>
tnoremap   <silent>   <F1>    <C-\><C-n>:FloatermToggle<CR>

nmap       <silent>   <F5>    :FloatermKill<CR>

"for make
nmap <silent>ma        :make<CR>
nmap <silent>mc        :make clean<CR>

"""""""""""""""""""""""""""""" Align
xmap ga            <Plug>(EasyAlign)
nmap ga            <Plug>(EasyAlign)

"""""""""""""""""""""""""""""" Grammar check
nmap \g         :GrammarousCheck --lang=es<CR>
nmap \gi        :GrammarousCheck<CR>

"""""""""""""""""""""""""""""" Tagbar
nnoremap tag <cmd>Tagbar<CR>

"""""""""""""""""""""""""""""" Find easy commadns with telescope
nnoremap <F12> <cmd>Telescope<CR>
nnoremap B <cmd>Telescope buffers<CR>
nnoremap cmd <cmd>Telescope commands<CR>
nnoremap <leader>h          <cmd>Telescope oldfiles<CR>
nnoremap <silent>  ff         <cmd>Telescope fd<CR>

"""""""""""""""""""""""""""""" Lazygit
nnoremap <leader>g <cmd>LazyGit<CR>

"""""""""""""""""""""""""""""" Sniprun 
nmap <silent>qr    <Plug>SnipRun
nmap <silent>qs    <Plug>SnipClose
vmap <silent>qr    <Plug>SnipRun

"""""""""""""""""""""""""""""" Vimterminator
"nmap <leader>rf    <Plug>Run current file
"nmap <leader>rs    <Plug>Stop running file
nmap <leader>rc    :TerminatorOutputBufferClose<CR>

"""""""""""""""""""""""""""""" Dashboardnewfile
nmap <leader>df    <cmd>DashboardNewFile<CR>
"nmap <leader>rs    <Plug>Stop running filc
