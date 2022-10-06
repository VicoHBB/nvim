set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax enable
set showcmd
set ruler
set cursorline  		"Muestra la linea en la que estamos
set cursorcolumn                "Muestra la columna en la que estamos
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
set laststatus=2
set signcolumn=yes               "To the vim signify on the other column"
"autocmd BufRead,BufNewFile * setlocal signcolumn=yes

"Para airline
"con airline nos indica  el modo, por lo que no es necesario que lo muestre
set noshowmode
set showtabline=2
"Shell for floaterm
set shell=/bin/zsh
" para verilog
set foldmethod=manual
" para spelling
set spell spelllang=es_es
""""""""""""""""""""""""""""""""""""""""""PlugIns
"Packer
lua require('plugins')
""""""""VIMPLUG
call plug#begin('~/.vim/plugged')

"Themes
	Plug 'morhetz/gruvbox'
"diseños de la barra de tareas
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
"IDE  Poder buscar caracteres
"Plug 'easymotion/vim-easymotion'
" Terminal
	Plug 'voldikss/vim-floaterm'
"NerdTree navegar entre archivos """""""""""""""""""""""
	Plug 'scrooloose/nerdtree' 
" devicons
  Plug 'ryanoasis/vim-devicons'
" git state
	Plug 'Xuyuanp/nerdtree-git-plugin'
" Syntax highlight
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Syntax highlight
	Plug 'PhilRunninger/nerdtree-visual-selection'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Poder moverse entre pestañas ctrl+HJKL
	Plug 'benmills/vimux'
	Plug 'christoomey/vim-tmux-navigator'
" Multiple cursors
	Plug 'terryma/vim-multiple-cursors'
" Muestra si se agrego una nueva linea
	if has('nvim') || has('patch-8.0.902')
  	Plug 'mhinz/vim-signify'
	else
  	Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
	endif
" Language
	Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
	Plug 'nvim-treesitter/nvim-treesitter-context'
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
	Plug 'jiangmiao/auto-pairs'
	Plug 'tpope/vim-surround'
" Comentarios
	Plug 'scrooloose/nerdcommenter'
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
	"vhdl
	Plug 'suoto/vim-hdl'
"LaTex
	Plug 'lervag/vimtex'
"Easy- aling
	Plug 'junegunn/vim-easy-align'
"ASM
	Plug 'shirk/vim-gas'
"Grammar
	Plug 'rhysd/vim-grammarous'
"Tagbar
	Plug 'preservim/tagbar'
"Go-to-preview
	Plug 'rmagatti/goto-preview'
"Anyjump
	Plug 'pechorin/any-jump.vim'
"LSP
	Plug 'neovim/nvim-lspconfig'
	Plug 'williamboman/nvim-lsp-installer'
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
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'nvim-telescope/telescope-media-files.nvim'
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
""""""""""""""""To probe""""""""""""""""
"Vim-which-key
	"Plug 'liuchengxu/vim-which-key'
" nvim-tree
	"Plug 'kyazdani42/nvim-tree.lua'
"xml
  Plug 'othree/xml.vim'	
"Tabnine
	"Plug 'zxqfl/tabnine-vim'
"YCM
	"Plug 'Valloric/YouCompleteMe'
"Vim-dap
	"Plug 'mfussenegger/nvim-dap'
"Vimspector
	"Plug 'puremourning/vimspector'
call plug#end()

let g:plug_timeout = 40000000

let g:vim_search_pulse_mode = 'pattern'

"if exists("g:neovide")
    "" Put anything you want to happen only in Neovide here
		"let g:neovide_scroll_animation_length = 0.3
		"let g:neovide_cursor_vfx_mode = "railgun"
"endif
"
let g:ruby_host_prog = '/home/vhbb/.local/share/gem/ruby/3.0.0/bin/neovim-ruby-host'

"perl
"source ~/.config/nvim/plugin_config/perl.vim
"languages 
source ~/.config/nvim/plugin_config/languages.vim
"theme
source ~/.config/nvim/plugin_config/theme.vim
"airline 
source ~/.config/nvim/plugin_config/airline.vim
"coc 
source ~/.config/nvim/plugin_config/coc.vim
"NerdTree
source ~/.config/nvim/plugin_config/nerdtree.vim
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
"Treesitter-context
source ~/.config/nvim/plugin_config/treesitter-context.vim
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
"which-key
"source ~/.config/nvim/plugin_config/which-key.vim


"hi Normal guibg=NONE ctermbg=NONE
" c
autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab

"For the screenshot
let g:vimShotSavePath="~/Pictures/code-screenshots"

"let g:ycm_server_keep_logfiles = 1
"let g:ycm_server_log_level = 'debug'

"""""""""""""""""""""""""""""""""""""""""""""""" Kite
""let g:kite_supported_languajes = ['javascript','python']

"" COC
""autocmd FileType python let b:coc_suggest_disable = 1
""autocmd FileType javascript let b:coc_suggest_disable  1

"""""""""""""""""""""""""""""""""""""""""""""""for lens
"let g:lens#disabled_filetypes = ['nerdtree']
"

"Ultisnippets
"let g:UltiSnipsExpandTrigger = "<tab>"
" Verilog
let g:SuperTabDefaultCompletionType = 'context'
" VHLD
let g:vimhdl_conf_file = '<config/file>'
