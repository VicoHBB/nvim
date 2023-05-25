vim.opt.number = true
vim.cmd([[ set mouse=a ]])
vim.cmd([[ set numberwidth=1 ]])
vim.cmd([[ set clipboard=unnamed ]])
vim.cmd([[ syntax enable ]])
vim.cmd([[ set showcmd ]])
vim.cmd([[ set ruler ]])
vim.cmd([[ set cursorline ]])
vim.cmd([[ set cursorcolumn ]])
vim.cmd([[ set encoding=UTF-8 ]])
vim.cmd([[ set showmatch ]])
vim.cmd([[ set sw=2 ]])
vim.opt.relativenumber = true
vim.cmd([[ set laststatus=2 ]])
vim.cmd([[ set noshowmode ]])
vim.cmd([[ set showtabline=2 ]])
vim.cmd([[ set shell=/bin/zsh ]])
vim.cmd([[ set foldmethod=manual ]])
vim.cmd([[ set spell spelllang=en_us ]])
vim.cmd([[ set runtimepath+=. ]])

-- Ruby Host
vim.g.ruby_host_prog = '/home/vhbb/.local/share/gem/ruby/3.0.0/bin/neovim-ruby-host'

-- [[ COC ]]
-- Some servers have issues with backup files, see #649
vim.opt.backup = false
vim.opt.writebackup = false
-- Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
-- delays and poor user experience
vim.opt.updatetime = 100
-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appeared/became resolved
vim.opt.signcolumn = "yes"

-- [[ Vimtex ]]
vim.cmd([[ filetype plugin indent on ]])
vim.opt.conceallevel = 1

--[[ Leader map ]]
vim.g.mapleader = " "

