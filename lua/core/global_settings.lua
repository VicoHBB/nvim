-- [[ General Settings ]]
vim.opt.number = true              -- Show absolute line numbers
vim.opt.relativenumber = true      -- Show relative line numbers (useful for jumping)
vim.opt.numberwidth = 1            -- Set the width of the number column to 1
vim.opt.cursorline = true          -- Highlight the line under the cursor
vim.opt.cursorcolumn = true        -- Highlight the column under the cursor
vim.opt.showcmd = true             -- Show command in the status line as you type
vim.opt.ruler = true               -- Show cursor position in the status line
vim.opt.encoding = "UTF-8"         -- Set file encoding to UTF-8
vim.opt.showmatch = true           -- Highlight matching parentheses
vim.opt.shiftwidth = 2             -- Set indentation width to 2 spaces
vim.opt.spell = true               -- Enable spell check
vim.opt.spelllang = "en_us"        -- Set spell check language to English (US)

-- [[ UI and Visual Settings ]]
vim.o.termguicolors = true         -- Enable 24-bit color support in the terminal
vim.opt.clipboard = "unnamed"      -- Use system clipboard for yank, delete, etc.
vim.opt.showmode = false           -- Disable mode display in the status line (redundant with 'laststatus')
vim.opt.showtabline = 2            -- Always show tab line (useful for multiple buffers)
vim.opt.list = true                -- Show hidden characters (tabs, spaces, etc.)
vim.opt.listchars = {              -- Customize how hidden characters appear
  tab = ">>",                      -- Show tabs as >>
  space = "·",                     -- Show spaces as a middle dot
  precedes = "…",                  -- Show ellipsis for preceded content
  extends = "…",                   -- Show ellipsis for extended content
  conceal = "",                   -- Use a custom symbol for concealed characters
  eol = " "                        -- Show end -of-line symbol
}

-- [[ Backup and Undo Settings ]]
vim.opt.backup = false                                         -- Disable backup files
vim.opt.writebackup = false                                    -- Disable write backup files
vim.opt.undodir = os.getenv("HOME") .. "/.cache/nvim/undodir"  -- Undo history directory

-- [[ Status Line and Shell ]]
vim.opt.laststatus = 2      -- Always show the status line
vim.opt.shell = "/bin/zsh"  -- Set default shell to ZSH (if needed)

-- [[ Filetype and Plugin Settings ]]
vim.cmd([[ filetype plugin indent on ]])  -- Enable filetype-specific plugins and indentation
vim.opt.conceallevel = 1                  -- Set conceal level to hide certain LaTeX syntax

-- [[ Providers (Ruby, Perl, etc.) ]]
-- Ruby Host path
vim.g.ruby_host_prog = '~/.local/share/gem/ruby/3.3.0/bin/neovim-ruby-host'
vim.g.loaded_perl_provider = 0          -- Disable Perl provider (not needed)

-- [[ Miscellaneous Settings ]]
vim.opt.updatetime = 100           -- Reduce the time for updates (in ms)
vim.opt.signcolumn = "yes"         -- Always show the sign column for diagnostics
vim.cmd('language en_US.utf8')     -- Optional: Set language for specific locales (not always necessary)

-- [[ Splits ]]
vim.o.splitbelow = true
vim.o.splitright = true

-- [[ Leader Key ]]
vim.g.mapleader = " "  -- Set the leader key to space
