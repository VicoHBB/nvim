# Neovim Dotfiles

This is my personal neovim configuration, fully set up with `lua` and using `lazy` as the plugin manager. This will
also serve as a reference point for information about the installed plugins, as well as some
[notes](./docs/cheatsheet.md) on the `neovim` configuration.


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
  - [For Windows](#for-windows)
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


## Dependencies

- For install dependencies install on `Arch` install [paru](https://github.com/Morganamilo/paru) or [yay](https://github.com/Jguer/yay) & run:
    ```sh
    yay -S - < dependencies.txt # change yay for paru
    ```

- For `nvim `providers run:
    ```sh
    gem intall neovim
    npm install -g neovim # Maybe run with sudo
    cargo install --locked tree-sitter-cli # tree-sitter-cli
    ```

- For some plugins run:
    ```sh
    # Snacks
    npm install -g @mermaid-js/mermaid-cli # Maybe run with sudo
    ```

- `dependencies.txt` just have basic stuff for `latex` files, to avoid install each package that you need you can run
the following command:
    ```sh
    yay -S texlive-full # Could take long time, change yay for paru
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
| [blink.cmp](https://github.com/Saghen/blink.cmp)                                            | 2025-03-15    |
| [bufferline](https://github.com/akinsho/bufferline.nvim?tab=readme-ov-file)                 | 2025-03-15    |
| [cmake-tools](https://github.com/Civitasv/cmake-tools.nvim)                                 | 2025-03-15    |
| [dial](https://github.com/monaqa/dial.nvim)                                                 | 2025-03-15    |
| [flash](https://github.com/folke/flash.nvim)                                                | 2025-03-15    |
| [fzf-lua](https://github.com/ibhagwan/fzf-lua)                                              | 2025-03-15    |
| [garbage-day](https://github.com/Zeioth/garbage-day.nvim)                                   | 2025-03-15    |
| [gitsigns](https://github.com/lewis6991/gitsigns.nvim)                                      | 2025-03-15    |
| [gruvbox-material](https://github.com/sainnhe/gruvbox-material)                             | 2025-03-15    |
| [gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim)                                 | 2025-03-15    |
| [headlines](https://github.com/lukas-reineke/headlines.nvim)                                | 2025-03-15    |
| [lazy](https://github.com/folke/lazy.nvim)                                                  | 2025-03-15    |
| [lspconfig](https://github.com/neovim/nvim-lspconfig/tree/master)                           | 2025-03-15    |
| [lspsaga](https://nvimdev.github.io/lspsaga/)                                               | 2025-03-15    |
| [ltex-client](https://github.com/icewind/ltex-client.nvim)                                  | 2025-03-15    |
| [lualine](https://github.com/nvim-lualine/lualine.nvim)                                     | 2025-03-15    |
| [luasnip](https://github.com/L3MON4D3/LuaSnip)                                              | 2025-03-15    |
| [markdown-preview](https://github.com/iamcco/markdown-preview.nvim.git)                     | 2025-03-15    |
| [markdown-render](https://github.com/MeanderingProgrammer/render-markdown.nvim.git)         | 2025-03-15    |
| [markdown](https://github.com/tadmccorkle/markdown.nvim)                                    | 2025-03-15    |
| [mini](https://github.com/echasnovski/mini.nvim.git)                                        | 2025-03-15    |
| [neogit](https://github.com/NeogitOrg/neogit)                                               | 2025-03-15    |
| [noice](https://github.com/folke/noice.nvim)                                                | 2025-03-15    |
| [nvim-bqf](https://github.com/kevinhwang91/nvim-bqf)                                        | 2025-03-15    |
| [nvim-navbuddy](https://github.com/SmiteshP/nvim-navbuddy.git)                              | 2025-03-15    |
| [nvim-orgmode](https://github.com/nvim-orgmode/orgmode)                                     | 2025-03-15    |
| [nvim-recorder](https://github.com/chrisgrieser/nvim-recorder)                              | 2025-03-15    |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)                       | 2025-03-15    |
| [org-bullets](https://github.com/nvim-orgmode/org-bullets.nvim)                             | 2025-03-15    |
| [org-modern](https://github.com/danilshvalov/org-modern.nvim)                               | 2025-03-15    |
| [overseer](https://github.com/stevearc/overseer.nvim)                                       | 2025-03-15    |
| [project](https://github.com/ahmedkhalf/project.nvim)                                       | 2025-03-15    |
| [quicker](https://github.com/stevearc/quicker.nvim)                                         | 2025-03-15    |
| [reach](https://github.com/toppair/reach.nvim)                                              | 2025-03-15    |
| [snacks](https://github.com/folke/snacks.nvim)                                              | 2025-03-15    |
| [smart-splits](https://github.com/mrjones2014/smart-splits.nvim)                            | 2025-03-15    |
| [tabnine](https://github.com/codota/tabnine-nvim)                                           | 2025-03-15    |
| [tfm](https://github.com/Rolv-Apneseth/tfm.nvim)                                            | 2025-03-15    |
| [toggleterm](https://github.com/akinsho/toggleterm.nvim)                                    | 2025-03-15    |
| [undotree](https://github.com/jiaoshijie/undotree)                                          | 2025-03-15    |
| [verilog_systemverilog](https://github.com/vhda/verilog_systemverilog.vim)                  | 2025-03-15    |
| [vim-verilog-instance](https://github.com/antoinemadec/vim-verilog-instance)                | 2025-03-15    |
| [vimtex](https://github.com/lervag/vimtex)                                                  | 2025-03-15    |

### Dependencies of the plugins

These are plugins that serve as dependencies for others and do not require additional configuration.

### To probe

* [nvim-dap](https://github.com/mfussenegger/nvim-dap)
* [none-ls](https://github.com/nvimtools/none-ls.nvim)
* [dooku](https://github.com/Zeioth/dooku.nvim)
* [c.vim](https://github.com/vim-scripts/c.vim)
* [helpview](https://github.com/OXY2DEV/helpview.nvim)
* [vim-table-mode](https://github.com/dhruvasagar/vim-table-mod)
* [LazyDo](https://github.com/Dan7h3x/LazyDo)
* https://vonheikemen.github.io/devlog/es/tools/setup-nvim-lspconfig-plus-nvim-cmp/

### Maybe Remove?

## For Windows
Just use it for taking notes because there are a couple of plugins that does not work properly on windows, so the
flag `Is_Not_Win32` disable those ones, but some features still work weirdly.

- To move between diagnostics (because use stable version):
```lua
-- Change
vim.diagnostic.jump({ count = -1, float = true }) -- Jump to previous Dx
vim.diagnostic.jump({ count = 1, float = true })  -- Jump to next DX
-- For
vim.diagnostic.goto_prev()
vim.diagnostic.goto_next()
```


## Related Projects
* [SystemVerilog Template](https://gitlab.com/HugoBec/sv-template.git)
