local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- Put the plugins here
local plugins = {
  --[[ Tried and tested ]]
  -- themes
  "morhetz/gruvbox",
  { "catppuccin/nvim", name = "catppuccin" },
  "voldikss/vim-floaterm",                                        -- Floaterm
  {                                                               -- NvimTree

    "nvim-tree/nvim-tree.lua",
    dependencies = 'nvim-tree/nvim-web-devicons'
  },
  {                                                               -- Bufferline
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons'
  },
  {                                                               -- Lualine
    "nvim-lualine/lualine.nvim",
    dependencies = 'nvim-tree/nvim-web-devicons'
  },
  "ryanoasis/vim-devicons",                                       -- Vim devicons
  "benmills/vimux",                                               -- Tmux
  "christoomey/vim-tmux-navigator",
  "terryma/vim-multiple-cursors",                                 -- Multiple cursors
  "mhinz/vim-signify",                                            -- Vim signify
  {                                                               -- Nvim treesitter
    "nvim-treesitter/nvim-treesitter",
    build = "TSUpdate"
  },
  "haringsrob/nvim_context_vt",                                   -- Nvim context virtaul text
  "lukas-reineke/indent-blankline.nvim",                          -- Ident line
  {                                                               -- FZF
    "junegunn/fzf",
    -- build = { -> fzf#install() },
  },
  "junegunn/fzf.vim",
  "airblade/vim-rooter",                                          -- Vim Rooter
  {                                                               -- COC
    "neoclide/coc.nvim",
    branch = "release"
  },
  "sheerun/vim-polyglot",                                         -- Syntax
  -- Completar brackets y parentesis
  "windwp/nvim-autopairs",                                        -- Autopairs
  "tpope/vim-surround",                                           -- Vim surround
  "numToStr/Comment.nvim",                                        -- Commentaries
  "kevinhwang91/rnvimr",                                          -- Ranger
  "kdheepak/lazygit.nvim",                                        -- Lazygit
  "honza/vim-snippets",                                           -- Snippets
  "SirVer/ultisnips",                                             -- Ultisnips
  "metakirby5/codi.vim",                                          -- Codi
  "vhda/verilog_systemverilog.vim",                               -- SystemVerilog
  "antoinemadec/vim-verilog-instance",                            -- SV Instance
  "lervag/vimtex",                                                -- VimTex
  "junegunn/vim-easy-align",                                      -- Easy align
  "shirk/vim-gas",                                                -- ASM
  "preservim/tagbar",                                             -- Tagbar

  "pechorin/any-jump.vim",                                        -- AnyJump
  -- LSP
  'neovim/nvim-lspconfig',                                        -- Config
  {                                                               -- Saga
    'glepnir/lspsaga.nvim',
    branch = "main"
  },
  'Kasama/nvim-custom-diagnostic-highlight',                      -- Highlight
  'folke/trouble.nvim',                                           -- Trouble
  'ray-x/lsp_signature.nvim',                                     -- Signature
  "rmagatti/goto-preview",                                        -- Go-to-preview
  {                                                               -- Action Menu
    "weilbith/nvim-code-action-menu",
    cmd = 'CodeActionMenu'
  },
  { ---------------------------------------------------------------- Mason
    "williamboman/mason.nvim",
    build = ":MasonUpdate"
  },
  'williamboman/mason-lspconfig.nvim',
  'mfussenegger/nvim-lint',                                       -- Linter
  'mhartington/formatter.nvim',                                   -- Formater
  -- LSP
  {                                                               -- Local History
    "dinhhuy258/vim-local-history",
    branch = "master",
    build = ":UpdateRemotePlugins"
  },
  'erietz/vim-terminator',                                        -- Terminator
  {                                                               -- Sniprun
    "michaelb/sniprun",
    build = "bash install.sh"
  },
  {                                                               -- Dashboard 
    'glepnir/dashboard-nvim',
    lazy = false,
  },
  {                                                               -- Alpha
    "goolord/alpha-nvim",
    lazy = false,
  },
  -- [[ Telescope ]]
  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",
  "nvim-telescope/telescope.nvim",
  'nvim-telescope/telescope-media-files.nvim',
  'jvgrootveld/telescope-zoxide',
  'fannheyward/telescope-coc.nvim',
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
  },
  "nvim-telescope/telescope-ui-select.nvim",
  -- [[ Telescope ]]
  {                                                               -- HOP
    "phaazon/hop.nvim",
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end,
  },
  {                                                               -- Markdown Viwer
    "iamcco/markdown-preview.nvim",
    build = "cd app && yarn install"
  } ,
  {                                                               -- Screenshoot
    "SergioRibera/vim-screenshot",
    build = "npm install --prefix Renderizer",
  },
  -- [[ CMP ]
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "onsails/lspkind-nvim",
  "dmitmel/cmp-cmdline-history",
  "kdheepak/cmp-latex-symbols",
  "f3fora/cmp-spell",
  "lukas-reineke/cmp-under-comparator",
  "tzachar/cmp-fuzzy-buffer",
  "tzachar/fuzzy.nvim",
  "tzachar/cmp-fuzzy-path",
  "lukas-reineke/cmp-rg",
  "quangnguyen30192/cmp-nvim-ultisnips",
  {                                                               -- Tabnine
    "tzachar/cmp-tabnine",
    build = "./install.sh"
  },
  -- [[ CMP ]
  "terrastruct/d2-vim",                                           -- D2
  "karb94/neoscroll.nvim",                                        -- Neoscroll
  "SmiteshP/nvim-navic",                                          -- Navic
  "SmiteshP/nvim-navbuddy",                                       -- Navbudy
  "mizlan/iswap.nvim",                                            -- ISwap
  "jackMort/ChatGPT.nvim",                                        -- ChatGPT
  "MunifTanjim/nui.nvim",                                         -- NUI
  {                                                               -- GUIHA
    'ray-x/guihua.lua',
    build = "cd lua/fzy && make",
  },
  'ray-x/sad.nvim',                                               -- SAD
  "chentoast/marks.nvim",                                         -- Mars
  "skywind3000/asyncrun.vim",                                     -- Asyncrn
  {                                                               -- Harpon
    "ThePrimeagen/harpoon",
    config = function()
      require("harpoon").setup({
          menu = {
              width = vim.api.nvim_win_get_width(0) - 4,
          }
      })
    end,
  },
  "xiyaowong/virtcolumn.nvim",          --                        -- Virtual column
  "gorbit99/codewindow.nvim",
  "nvim-zh/colorful-winsep.nvim",
  -- Funny
  "eandrju/cellular-automaton.nvim",
  --[[ To test ]]
  "ziontee113/syntax-tree-surfer",
  "nvim-orgmode/orgmode",
  "othree/xml.vim",
  "vim-scripts/c.vim",                                            -- For C
  "ludwig/split-manpage.vim",                                     -- split
  "webastien/vim-ctags",                                          -- Ctags
  "frazrepo/vim-rainbow",                                         -- Vim rainbow
  "thanthese/Tortoise-Typing",                                    -- Typing
  "zyedidia/vim-snake",                                           -- Snake gam
  "vim-scripts/bccalc.vim",                                       -- Calculate with bc
  "tpope/vim-endwise",                                            -- Endwise

}

local opts = {}

require("lazy").setup(plugins, opts)
