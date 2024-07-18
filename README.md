# Neovim configuration files

These files are my configuration for Neovim, also using `Vim-Plug` as a plugin manager; it is a combination with `packer`(using two plugin managers is not recommended), being this the first attempt to migrate the configuration from `vimscript` to `lua`.

## To-DO
* [ ] Review plugins
* [ ] Clean plugins (There are to many, and don't even use)
* [ ] Review keybindings
* [ ] Add descriptions to keybindings
* [ ] Change `yabs` for `overseer`
* [ ] Update `cmake-tools`
* [ ] Change `Ultisnips`
* [-] Create a command for align tables in `makrdown` & `orgmode`
* [ ] Review macros & registers
* [ ] Install a plugin for a terminal


## Plugins

### Installed

| Plugin                                                                            | Last Review   |
| --------------------------------------------------------------------------------- | ------------- |
| [Comment](https://github.com/numToStr/Comment.nvim)                               | 2024-07-17    |
| [alpha](https://github.com/goolord/alpha-nvim)                                    | 2024-07-17    |
| [bufferline](https://github.com/akinsho/bufferline.nvim?tab=readme-ov-file)       | 2024-07-17    |
| [cmp](https://github.com/hrsh7th/nvim-cmp)                                        | 2024-07-15    |
| [colorful-winsep](https://github.com/nvim-zh/colorful-winsep.nvim)                | 2024-07-17    |
| [gitsigns](https://github.com/lewis6991/gitsigns.nvim)                            | 2024-06-19    |
| [gitsigns](https://github.com/lewis6991/gitsigns.nvim)                            | 2024-07-16    |
| [gruvbox-material](https://github.com/sainnhe/gruvbox-material)                   | 2024-07-16    |
| [gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim)                       | 2024-07-16    |
| [headlines](https://github.com/lukas-reineke/headlines.nvim)                      | 2024-07-17    |
| [jiaoshijie/undotree](https://github.com/jiaoshijie/undotree)                     | 2024-06-22    |
| [noice](https://github.com/folke/noice.nvim)                                      | 2024-07-14    |
| [nvim-navbuddy](https://github.com/SmiteshP/nvim-navbuddy.git)                    | 2024-06-19    |
| [nvim-orgmode](https://github.com/nvim-orgmode/orgmode)                           | 2024-06-19    |
| [nvim-telescope](https://github.com/nvim-telescope/telescope.nvim)                | 2024-06-23    |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)             | 2024-07-16    |
| [org-bullets](https://github.com/nvim-orgmode/org-bullets.nvim)                   | 2024-06-19    |
| [org-modern](https://github.com/danilshvalov/org-modern.nvim)                     | 2024-06-19    |
| [reach](https://github.com/toppair/reach.nvim)                                    | 2024-06-23    |
| [tabnine](https://github.com/codota/tabnine-nvim)                                 | 2024-07-14    |
| [telescope-orgmode](https://github.com/nvim-orgmode/telescope-orgmode.nvim)       | 2024-06-19    |
| [treehopper](https://github.com/mfussenegger/nvim-treehopper)                     | 2024-07-16    |
| [vim-easy-align](https://github.com/junegunn/vim-easy-align)                      | 2024-06-19    |

### To probe.

* [vim-table-mode](https://github.com/dhruvasagar/vim-table-mode)
* [overseer](https://github.com/stevearc/overseer.nvim)
* [luasnip](https://github.com/L3MON4D3/LuaSnip)
* [dooku](https://github.com/Zeioth/dooku.nvim)
* [formatter](https://github.com/mhartington/formatter.nvim)
* https://vonheikemen.github.io/devlog/es/tools/setup-nvim-lspconfig-plus-nvim-cmp/

### Maybe Remove?

