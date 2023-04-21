set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax enable
set showcmd
set ruler
set cursorline                  "Muestra la linea en la que estamos
set cursorcolumn                "Muestra la columna en la que estamos
set encoding=UTF-8
set showmatch
set sw=2
set relativenumber
set laststatus=2
set signcolumn=yes               "To the vim signify on the other column"
"set autochdir
"autocmd BufRead,BufNewFile * setlocal signcolumn=yes

"For lualine
"Lualine shows mode, so is necesarry to disable
set noshowmode
set showtabline=2
"Shell for floaterm
set shell=/bin/zsh
" para verilog
set foldmethod=manual
" para spelling
set spell spelllang=es_es
" for autopairs
set runtimepath+=.

""""""""""""""""""""""""""""""""""""""""""PlugIns
"Packer
lua require('plugins')
""""""""Vimplug
call plug#begin('~/.vim/plugged')
"Themes
  Plug 'morhetz/gruvbox'
" Terminal
  Plug 'voldikss/vim-floaterm'
" nvim-tree
  Plug 'nvim-tree/nvim-tree.lua'
" bufferline
   Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }
" Lualine
  Plug 'nvim-lualine/lualine.nvim'
"" devicons
  Plug 'ryanoasis/vim-devicons'
"Poder moverse entre pestañas ctrl+HJKL
  Plug 'benmills/vimux'
  Plug 'christoomey/vim-tmux-navigator'
" Multiple cursors
	Plug 'terryma/vim-multiple-cursors'
" Muestra si se agego una nueva linea
  if has('nvim') || has('patch-8.0.902')
    Plug 'mhinz/vim-signify'
  else
    Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
  endif
" Highlight Language
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'haringsrob/nvim_context_vt'
" Lidea de identacón
  Plug 'lukas-reineke/indent-blankline.nvim'
" fzf
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  " Vim rooter
  Plug 'airblade/vim-rooter'
"Auto-completado solo para Vim
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Syntax colors
  Plug 'sheerun/vim-polyglot'
" Completar brackets y parentesis
  "Plug 'jiangmiao/auto-pairs'
  Plug 'windwp/nvim-autopairs'
  Plug 'tpope/vim-surround'
" Commentaries
  Plug 'numToStr/Comment.nvim'        " Optional
" C
  Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}
  Plug 'ludwig/split-manpage.vim'
"Ranger
  Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
"	Plug 'francoiscabrol/ranger.vim'
"	Lazy-git
  Plug 'kdheepak/lazygit.nvim'
" Color for bracketw
  Plug 'frazrepo/vim-rainbow'
"Snippets
  Plug 'honza/vim-snippets'
"Codi
  Plug 'metakirby5/codi.vim'
  "Plug 'ChristianChiarulli/codi.vim'
"verilog_systemverilog
  Plug 'vhda/verilog_systemverilog.vim'
" Verilog instance
  Plug 'antoinemadec/vim-verilog-instance'
"vhdl
  Plug 'suoto/vim-hdl'
"LaTex
  Plug 'lervag/vimtex'
  "Plug 'jbyuki/nabla.nvim'
"Easy- aling
  Plug 'junegunn/vim-easy-align'
"ASM
  Plug 'shirk/vim-gas'
"Tagbar
  Plug 'preservim/tagbar'
"Go-to-preview
  Plug 'rmagatti/goto-preview'
"Anyjump
  Plug 'pechorin/any-jump.vim'
"LSP
  Plug 'neovim/nvim-lspconfig'
  Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
  Plug 'Kasama/nvim-custom-diagnostic-highlight'
  Plug 'folke/trouble.nvim'
  "Plug 'ray-x/lsp_signature.nvim'
""Mason
    Plug 'williamboman/mason.nvim', { 'do': ':MasonUpdate' }
    Plug 'williamboman/mason-lspconfig.nvim'
""Language tools for Mason
      Plug 'mfussenegger/nvim-lint'       " linters
      Plug 'mhartington/formatter.nvim'   " formatter
"goto-preview
  Plug 'rmagatti/goto-preview'
"History
  Plug 'dinhhuy258/vim-local-history', {'branch': 'master', 'do': ':UpdateRemotePlugins'}
"Terminator
  Plug 'erietz/vim-terminator'
"Sniprun
  Plug 'michaelb/sniprun', {'do': 'bash install.sh'}
"Dashboard
  Plug 'glepnir/dashboard-nvim'
"Telescope
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-media-files.nvim'
  Plug 'jvgrootveld/telescope-zoxide'
  Plug 'fannheyward/telescope-coc.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
  Plug 'nvim-telescope/telescope-ui-select.nvim'
"Hop
  Plug 'phaazon/hop.nvim'
"Tortoise-Typing
  Plug 'thanthese/Tortoise-Typing'
"Vim-snake
  Plug 'zyedidia/vim-snake'
"Markdown
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
" alpha
  Plug 'goolord/alpha-nvim'
" Devicon
  Plug 'kyazdani42/nvim-web-devicons'
" bccalc
  Plug 'vim-scripts/bccalc.vim'
"Endwise
  Plug 'tpope/vim-endwise'
"Vim screenshot
  Plug 'SergioRibera/vim-screenshot', { 'do': 'npm install --prefix Renderizer' }
"nvim-cmp""""""""""""""""""""""""""""""""""""""""""""""""
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'onsails/lspkind-nvim'
  Plug 'dmitmel/cmp-cmdline-history'
  Plug 'kdheepak/cmp-latex-symbols'
  Plug 'f3fora/cmp-spell'
"Tabnine
  Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
"fzf
  Plug 'tzachar/cmp-fuzzy-buffer'
  Plug 'tzachar/fuzzy.nvim'
  Plug 'tzachar/cmp-fuzzy-path'
"Rg
  Plug 'lukas-reineke/cmp-rg'
" For ultisnips users.
  Plug 'quangnguyen30192/cmp-nvim-ultisnips'
  Plug 'SirVer/ultisnips'
" d2
  Plug 'terrastruct/d2-vim'
" Neoscroll
  Plug 'karb94/neoscroll.nvim'
" Nvim-navbuddy
  Plug 'SmiteshP/nvim-navic'
  Plug 'SmiteshP/nvim-navbuddy'
" isawp
  Plug 'mizlan/iswap.nvim'
" ChatGPT
  Plug 'jackMort/ChatGPT.nvim'
  Plug 'MunifTanjim/nui.nvim'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""To probe""""""""""""""""
" Org
  Plug 'nvim-orgmode/orgmode'
  "Plug 'nvim-neorg/neorg'
  "Plug 'folke/zen-mode.nvim'
"xml
  Plug 'othree/xml.vim'	
" null-ls.nvim
  " Plug 'jose-elias-alvarez/null-ls.nvim'
"Nvim-spectre
	Plug 'windwp/nvim-spectre'
"Vim-which-key
	"Plug 'liuchengxu/vim-which-key'
"Vim-dap
	"Plug 'mfussenegger/nvim-dap'
"Vimspector
	"Plug 'puremourning/vimspector'
call plug#end()

let g:plug_timeout = 40000000

let g:vim_search_pulse_mode = 'pattern'

" Ruby Host
let g:ruby_host_prog = '/home/vhbb/.local/share/gem/ruby/3.0.0/bin/neovim-ruby-host'

"perl
"source ~/.config/nvim/plugin_config/perl.vim
"languages 
source ~/.config/nvim/plugin_config/lsp_config.vim
"theme
source ~/.config/nvim/plugin_config/theme.vim
"lualine 
source ~/.config/nvim/plugin_config/lualine.vim
"bufferline 
source ~/.config/nvim/plugin_config/bufferline.vim
"coc 
source ~/.config/nvim/plugin_config/coc.vim
"Nvim-tree
source ~/.config/nvim/plugin_config/nvim-tree.vim
"vimtex
source ~/.config/nvim/plugin_config/vimtex.vim
"fzf 
source ~/.config/nvim/plugin_config/fzf.vim
"Lazygit
source ~/.config/nvim/plugin_config/lazygit.vim
"Codi
source ~/.config/nvim/plugin_config/codi.vim
"Anyjump
source ~/.config/nvim/plugin_config/anyjump.vim
"Sniprun
source ~/.config/nvim/plugin_config/sniprun.vim
"GoTo preview
source ~/.config/nvim/plugin_config/goto_preview.vim
"Terminator
source ~/.config/nvim/plugin_config/terminator.vim
"Dashboard
source ~/.config/nvim/plugin_config/dashboard.vim
"Treesitter
source ~/.config/nvim/plugin_config/treesitter.vim
"Nvim_contxt_vt
source ~/.config/nvim/plugin_config/nvim_context_vt.vim
"Indentline
source ~/.config/nvim/plugin_config/indent-blankline.vim
"Telescope
source ~/.config/nvim/plugin_config/telescope.vim
"Hop
source ~/.config/nvim/plugin_config/hop.vim
"Markdown
source ~/.config/nvim/plugin_config/markdown_preview.vim
"Keyapping
source ~/.config/nvim/plugin_config/keymapping.vim
"org
source ~/.config/nvim/plugin_config/org.vim
"nvim-cmp
source ~/.config/nvim/plugin_config/nvim-cmp.vim
"neoscroll
source ~/.config/nvim/plugin_config/neoscroll.vim
"nvim-autopairs
source ~/.config/nvim/plugin_config/nvim-autopairs.vim
"nvim-navbuddy
source ~/.config/nvim/plugin_config/nvim-navbuddy.vim
"Comment
source ~/.config/nvim/plugin_config/Comment.vim
"Iswap
source ~/.config/nvim/plugin_config/iswap.vim
"ChatGPT
source ~/.config/nvim/plugin_config/chatgpt.vim
"which-key
"source ~/.config/nvim/plugin_config/which-key.vim

"hi Normal guibg=NONE ctermbg=NONE
" c
autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab
"autocmd FileType verilog_systemverilog cmd VerilogErrorFormat Verilator 1
"autocmd FileType verilog_systemverilog :VerilatorErrorFormat Verilator 1

"For the screenshot
let g:vimShotSavePath="~/Pictures/code-screenshots"

let g:rooter_patterns = ['.git', 'makefile' ]
let g:rooter_change_directory_for_non_project_files = 'current'

"""""""""""""""""""""""""""""""""""""""""""""""" Kite
""let g:kite_supported_languajes = ['javascript','python']

"" COC
""autocmd FileType python let b:coc_suggest_disable = 1
""autocmd FileType javascript let b:coc_suggest_disable  1
"""""""""""""""""""""""""""""""""""""""""""""""""""

" LaTeX {{{3
"let g:tagbar_type_latex = {
		"\ 'ctagstype' : 'latex',
		"\ 'kinds'     : [
				"\ 's:sections',
				"\ 'g:graphics:0:0',
				"\ 'l:labels',
				"\ 'r:refs:1:0',
				"\ 'p:pagerefs:1:0'
		"\ ],
		"\ 'sort'    : 0,
		"\ 'deffile' : expand('<sfile>:p:h:h') . '/ctags/latex.cnf'
"\ }

"Ultisnippets
"let g:UltiSnipsExpandTrigger = "<tab>"
" Verilog
let g:SuperTabDefaultCompletionType = 'context'

"Test for lua
lua << EOF

EOF
