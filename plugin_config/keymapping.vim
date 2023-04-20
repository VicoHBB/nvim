"""""""""""""""""""""""""""""""""""""""""""""""Keymaps
"Tecla lider ESPACIO
let mapleader=" "
nmap <silent><leader>         <Cmd>echo 'What to do?'<CR>
nmap <silent><leader><leader> <Cmd>echo 'Think'<CR>

"''''''''''''''''''''''''''''''''''''''''''''''COC
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation. COC
"nmap <silent> gd <Plug>('jumpDefinition','tab drop')<CR>
"COC
"nmap <silent> gd <Plug>(coc-definition)       
nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
"LSP saga
nmap <silent> gd <cmd>Lspsaga goto_definition<CR>
nmap <silent> gr <cmd>Lspsaga lsp_finder<CR>
nmap <silent> gt <cmd>Lspsaga peek_definition<CR>
nmap <silent> g? <cmd>Lspsaga hover_doc<CR>


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
" COC
"nmap <leader>r <Plug>(coc-rename)
" Lspsaga
nmap <leader>r <cmd>Lspsaga rename<CR>

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
" COC
"xmap <leader>a  <Plug>(coc-codeaction-selected)
" Lspsaga
"nmap <leader>a  <cmd>Lspsaga code_action<CR>
" Code action menu
nmap <leader>a  <cmd>CodeActionMenu<CR>

" Remap keys for applying codeAction to the current buffer.
"nmap <leader>ac  <Plug>(coc-codeaction)
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

""""""""""""""""""""""""""""" Hop
nmap fc  :HopChar2<CR>
nmap fw  :HopWord<CR>
nmap fl  :HopLine<CR>
nmap fW  :HopPattern<CR>

""""""""""""""""""""""""""""" Hop
nmap <leader>s   <cmd>ISwap<CR>
nmap <leader>sw  <cmd>ISwapWith<CR>
nmap <leader>sn  <cmd>ISwapNode<CR>

"""""""""""""""""""""""""" NERDTree
"nmap <Leader>n :NERDTreeFind<CR>

"""""""""""""""""""""""""" NvimTree
nmap <Leader>n :NvimTreeToggle<CR>

""""""""""""""""""""""""""""" Ranger
let g:ranger_map_keys = 0
map  F :RnvimrToggle<CR>

""""""""""""""""""""""""""""" Navbuddy
nmap <Leader>N :Navbuddy<CR>

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
nnoremap <silent> tj      :TmuxNavigateDown  <CR>
nnoremap <silent> <C-k>   :TmuxNavigateUp    <CR>
nnoremap <silent> <C-l>   :TmuxNavigateRight <CR>
nnoremap <silent> <C-p>   :TmuxNavigatePrevious <CR>

"""""""""""""""""""""""""""""" Faster scrolling
nnoremap <silent> <C-Down>  10j
nnoremap <silent> <C-Up>    10k

""""""""""""""""""""""""""""""" Signify 
"nnoremap <silent>     <F12>  :SignifyToggle<CR>
"See changes
nnoremap <silent>     <F6>   :SignifyHunkDiff<CR>
nnoremap <silent>     <F7>   :SignifyToggleHighlight<CR>
"nnoremap <silent>     <F6>   :SignifyDiff<CR>

"""""""""""""""""""""""""""""" FZF
"nnoremap <silent>  ff         :Files<CR>
nnoremap <silent>  <Leader>l :Lines<CR>
nnoremap <silent>  <Leader>S :Rg<CR>
nnoremap fzh       <cmd>History<CR>

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
nmap <silent>mr        :make run<CR>
nmap <silent>md        :FloatermNew make debug<CR>
nmap <silent>mc        :make clean<CR>
nmap <silent>mv        :make view<CR>

"""""""""""""""""""""""""""""" Align
xmap ga            <Plug>(EasyAlign)
nmap ga            <Plug>(EasyAlign)

"""""""""""""""""""""""""""""" Tagbar
nnoremap tag <cmd>Tagbar<CR>

"""""""""""""""""""""""""""""" Find easy commadns with telescope
nnoremap <F12>              <cmd>Telescope prompt_prefix=🔍<CR>
nnoremap B                  <cmd>Telescope buffers prompt_prefix=🔍<CR>
nnoremap cmd                <cmd>Telescope commands theme=dropdown prompt_prefix=🔍<CR>
nnoremap coc                <cmd>Telescope coc theme=ivy prompt_prefix=🔍<CR>
nnoremap <leader> h         <cmd>Telescope oldfiles prompt_prefix=🔍<CR>
nnoremap <silent>  ff       <cmd>Telescope fd prompt_prefix=🔍<CR>

"""""""""""""""""""""""""""""" Select open buffer
nnoremap bp                 <cmd>BufferLinePick<CR>

"""""""""""""""""""""""""""""" Lazygit
nnoremap <leader>g <cmd>LazyGit<CR>

"""""""""""""""""""""""""""""" Sniprun 
nmap <silent>qr    <Plug>SnipRun
nmap <silent>qs    <Plug>SnipClose

"""""""""""""""""""""""""""""" Vimterminator
"nmap <leader>rf    <Plug>Run current file
"nmap <leader>rs    <Plug>Stop running file
nmap <leader>rc    :TerminatorOutputBufferClose<CR>

"""""""""""""""""""""""""""""" Dashboardnewfile
nmap <leader>df    <cmd>DashboardNewFile<CR>
"nmap <leader>rs    <Plug>Stop running filc
"
"""""""""""""""""""""""""""""" Take screenshoot
vnoremap <silent>ts :'<,'>TakeScreenShot<CR><Cmd>echo 'Take screenshot'<CR>

"""""""""""""""""""""""""""""" Lspsaga Dx
nmap <leader>[     <cmd>Lspsaga diagnostic_jump_prev<CR>
nmap <leader>]     <cmd>Lspsaga diagnostic_jump_next<CR>
nmap <leader>?     <cmd>Lspsaga show_buf_diagnostics<CR>
"nmap <leader>dl    <cmd>Lspsaga show_line_diagnostics<CR

"""""""""""""""""""""""""""""" Verilog_Systemverilog
nnoremap fi <cmd>VerilogFollowInstance<CR>
nnoremap fp <cmd>VerilogFollowPort<CR>
nnoremap <leader>u <cmd>VerilogGotoInstanceStart<CR>

" Customize with popup({border = ...})  : `single` (default), `double`, `rounded`
"nnoremap <leader>\ <cmd>lua require("nabla").toggle_virt({ autogen = true, silent = true, align_center=true, })<CR> 

