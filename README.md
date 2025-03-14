# Neovim Dotfiles

This is my personal neovim configuration, fully set up with `lua` and using `lazy` as the plugin manager. This will also serve as a reference point for information about the installed plugins, as well as some [notes](./docs/cheatsheet.md) on the `neovim` configuration.


---

<!--toc:start-->
- [Neovim Dotfiles](#neovim-dotfiles)
  - [To-Do](#to-do)
  - [Dependencies](#dependencies)
  - [Supported Languages and Development Environments](#supported-languages-and-development-environments)
  - [Plugins](#plugins)
    - [Installed](#installed)
    - [Dependencies of the plugins](#dependencies-of-the-plugins)
    - [To probe](#to-probe)
    - [Maybe Remove?](#maybe-remove)
  - [Related Projects](#related-projects)
<!--toc:end-->

---


## To-Do
* [ ] Review plugins
* [ ] Clean plugins (There are to many, and don't even use)
* [ ] Review keybindings
    - [ ] Improve keybindings for git actions
    - [ ] Add descriptions to keybindings
* [ ] Create a command for align tables in `makrdown` & `orgmode`
* [ ] Review why `vimtex` is running slow
* [ ] Improve documentation
* [ ] Disable some plugins for`Windows`

## Dependencies

For install dependencies install on `Arch` install [paru](https://github.com/Morganamilo/paru) or [yay](https://github.com/Jguer/yay) & run:
```sh
paru -S - < dependencies.txt
```

For `nvim `providers run:
```sh
gem intall neovim
npm install -g neovim # Maybe run with sudo
cargo install --locked tree-sitter-cli # tree-sitter-cli
```

For some plugins run:
```sh
# Snacks
npm install -g @mermaid-js/mermaid-cli # Maybe run with sudo
```

## Supported Languages and Development Environments
This configuration is primarily focused on **Embedded Systems** and supports the following languages and development environments:
- `C`
- `C++`
- `Lua`
- `Markdown`
- `MicroPython`
- `Org`
- `Python`
- `SystemVerilog`
- `TeX`
- `Verilog`

Planned for future updates:
- `Assembly`
- `Rust`
- `Bash`

## Plugins

### Installed

These are the plugins that have been installed and configured.

| Plugin                                                                                      | Last Review   |
| ------------------------------------------------------------------------------------------- | ------------- |
| [blink.cmp](https://github.com/Saghen/blink.cmp)                                            | 2025-02-15    |
| [bufferline](https://github.com/akinsho/bufferline.nvim?tab=readme-ov-file)                 | 2024-08-31    |
| [cmake-tools](https://github.com/Civitasv/cmake-tools.nvim)                                 | 2025-02-15    |
| [cmp](https://github.com/hrsh7th/nvim-cmp)                                                  | 2024-10-01    |
| [dial](https://github.com/monaqa/dial.nvim)                                                 | 2025-03-07    |
| [flash](https://github.com/folke/flash.nvim)                                                | 2024-07-27    |
| [fzf-lua](https://github.com/ibhagwan/fzf-lua)                                              | 2024-08-31    |
| [garbage-day](https://github.com/Zeioth/garbage-day.nvim)                                   | 2025-02-03    |
| [gitsigns](https://github.com/lewis6991/gitsigns.nvim)                                      | 2024-06-19    |
| [gruvbox-material](https://github.com/sainnhe/gruvbox-material)                             | 2024-07-16    |
| [gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim)                                 | 2024-07-16    |
| [headlines](https://github.com/lukas-reineke/headlines.nvim)                                | 2024-07-17    |
| [lazy](https://github.com/folke/lazy.nvim)                                                  | 2024-07-17    |
| [lspconfig](https://github.com/neovim/nvim-lspconfig/tree/master)                           | 2024-10-01    |
| [lspsaga](https://nvimdev.github.io/lspsaga/)                                               | 2024-10-01    |
| [ltex-client](https://github.com/icewind/ltex-client.nvim)                                  | 2024-08-13    |
| [lualine](https://github.com/nvim-lualine/lualine.nvim)                                     | 2024-08-31    |
| [luasnip](https://github.com/L3MON4D3/LuaSnip)                                              | 2025-02-15    |
| [markdown-preview](https://github.com/iamcco/markdown-preview.nvim.git)                     | 2024-10-01    |
| [markdown-render](https://github.com/MeanderingProgrammer/render-markdown.nvim.git)         | 2024-10-01    |
| [markdown](https://github.com/tadmccorkle/markdown.nvim)                                    | 2024-10-01    |
| [mini](https://github.com/echasnovski/mini.nvim.git)                                        | 2025-02-03    |
| [neogit](https://github.com/NeogitOrg/neogit)                                               | 2024-08-25    |
| [noice](https://github.com/folke/noice.nvim)                                                | 2024-08-31    |
| [nvim-bqf](https://github.com/kevinhwang91/nvim-bqf)                                        | 2024-08-11    |
| [nvim-navbuddy](https://github.com/SmiteshP/nvim-navbuddy.git)                              | 2024-06-19    |
| [nvim-orgmode](https://github.com/nvim-orgmode/orgmode)                                     | 2024-06-19    |
| [nvim-recorder](https://github.com/chrisgrieser/nvim-recorder)                              | 2024-07-20    |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)                       | 2024-08-31    |
| [org-bullets](https://github.com/nvim-orgmode/org-bullets.nvim)                             | 2024-06-19    |
| [org-modern](https://github.com/danilshvalov/org-modern.nvim)                               | 2024-06-19    |
| [overseer](https://github.com/stevearc/overseer.nvim)                                       | 2025-02-15    |
| [project](https://github.com/ahmedkhalf/project.nvim)                                       | 2024-08-25    |
| [quicker](https://github.com/stevearc/quicker.nvim)                                         | 2024-08-11    |
| [reach](https://github.com/toppair/reach.nvim)                                              | 2024-08-25    |
| [snacks](https://github.com/folke/snacks.nvim)                                              | 2025-01-23    |
| [smart-splits](https://github.com/mrjones2014/smart-splits.nvim)                            | 2025-03-07    |
| [tabnine](https://github.com/codota/tabnine-nvim)                                           | 2024-07-14    |
| [telescope-orgmode](https://github.com/nvim-orgmode/telescope-orgmode.nvim)                 | 2024-06-19    |
| [telescope](https://github.com/nvim-telescope/telescope.nvim)                               | 2024-08-31    |
| [tfm](https://github.com/Rolv-Apneseth/tfm.nvim)                                            | 2024-08-25    |
| [toggleterm](https://github.com/akinsho/toggleterm.nvim)                                    | 2024-08-12    |
| [undotree](https://github.com/jiaoshijie/undotree)                                          | 2024-06-22    |
| [verilog_systemverilog](https://github.com/vhda/verilog_systemverilog.vim)                  | 2024-07-20    |
| [vim-verilog-instance](https://github.com/antoinemadec/vim-verilog-instance)                | 2024-07-20    |
| [vimtex](https://github.com/lervag/vimtex)                                                  | 2024-07-20    |

### Dependencies of the plugins

These are plugins that serve as dependencies for others and do not require additional configuration.

### To probe

* [LazyDo](https://github.com/Dan7h3x/LazyDo)
* [c.vim](https://github.com/vim-scripts/c.vim)
* [dooku](https://github.com/Zeioth/dooku.nvim)
* [formatter](https://github.com/mhartington/formatter.nvim)
* [helpview](https://github.com/OXY2DEV/helpview.nvim)
* [none-ls](https://github.com/nvimtools/none-ls.nvim)
* [nvim-dap](https://github.com/mfussenegger/nvim-dap)
* [nvim-peekup](https://github.com/gennaro-tedesco/nvim-peekup)
* [vim-table-mode](https://github.com/dhruvasagar/vim-table-mod)
* https://vonheikemen.github.io/devlog/es/tools/setup-nvim-lspconfig-plus-nvim-cmp/

### Maybe Remove?

## Related Projects
* [SystemVerilog Template](https://gitlab.com/HugoBec/sv-template.git)
