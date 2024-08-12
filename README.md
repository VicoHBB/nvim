# Neovim configuration files

These files are my configuration for Neovim, also using `Vim-Plug` as a plugin manager; it is a combination with `packer`(using two plugin managers is not recommended), being this the first attempt to migrate the configuration from `vimscript` to `lua`.

## To-DO
* [ ] Review plugins
* [ ] Clean plugins (There are to many, and don't even use)
* [ ] Review keybindings
* [ ] Add descriptions to keybindings
* [ ] Change `yabs` for `overseer`
* [ ] Update `cmake-tools`
* [-] Create a command for align tables in `makrdown` & `orgmode`
* [ ] Install a plugin for a terminal
* [ ] Creat a .txt for dependencies.

## Dependencies
For install dependencies install on `Arch` install []() run:
```sh
paru -S - < dependencies.txt
```


## Plugins

### Installed

| Plugin                                                                            | Last Review   |
| --------------------------------------------------------------------------------- | ------------- |
| [lazy](https://github.com/folke/lazy.nvim)                                        | 2024-07-17    |
| [Comment](https://github.com/numToStr/Comment.nvim)                               | 2024-07-17    |
| [alpha](https://github.com/goolord/alpha-nvim)                                    | 2024-08-11    |
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
| [nvim-telescope](https://github.com/nvim-telescope/telescope.nvim)                | 2024-08-11    |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)             | 2024-07-16    |
| [org-bullets](https://github.com/nvim-orgmode/org-bullets.nvim)                   | 2024-06-19    |
| [org-modern](https://github.com/danilshvalov/org-modern.nvim)                     | 2024-06-19    |
| [reach](https://github.com/toppair/reach.nvim)                                    | 2024-06-23    |
| [tabnine](https://github.com/codota/tabnine-nvim)                                 | 2024-07-14    |
| [telescope-orgmode](https://github.com/nvim-orgmode/telescope-orgmode.nvim)       | 2024-06-19    |
| [vim-easy-align](https://github.com/junegunn/vim-easy-align)                      | 2024-06-19    |
| [vimtex](https://github.com/lervag/vimtex)                                        | 2024-07-20    |
| [verilog_systemverilog](https://github.com/vhda/verilog_systemverilog.vim)        | 2024-07-20    |
| [vim-verilog-instance](https://github.com/antoinemadec/vim-verilog-instance)      | 2024-07-20    |
| [nvim-recorder](https://github.com/chrisgrieser/nvim-recorder)                    | 2024-07-20    |
| [lualine](https://github.com/nvim-lualine/lualine.nvim)                           | 2024-07-20    |
| [nvim-peekup](https://github.com/gennaro-tedesco/nvim-peekup)                     | 2024-07-20    |
| [telescope-ui-select](https://github.com/nvim-telescope/telescope-ui-select.nvim) | 2024-07-20    |
| [codi](https://github.com/metakirby5/codi.vim)                                    | 2024-07-20    |
| [sniprun](https://github.com/michaelb/sniprun)                                    | 2024-07-20    |
| [flash](https://github.com/folke/flash.nvim)                                      | 2024-07-27    |
| [nvim-bqf](https://github.com/kevinhwang91/nvim-bqf)                              | 2024-08-11    |
| [quicker](https://github.com/stevearc/quicker.nvim)                               | 2024-08-11    |

### To probe.

* [vim-table-mode](https://github.com/dhruvasagar/vim-table-mode)
* [overseer](https://github.com/stevearc/overseer.nvim)
* [luasnip](https://github.com/L3MON4D3/LuaSnip)
* [dooku](https://github.com/Zeioth/dooku.nvim)
* [formatter](https://github.com/mhartington/formatter.nvim)
* https://vonheikemen.github.io/devlog/es/tools/setup-nvim-lspconfig-plus-nvim-cmp/

### Maybe Remove?

