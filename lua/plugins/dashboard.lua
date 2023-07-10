return {
  {                                                               -- Dashboard
    'glepnir/dashboard-nvim',
    lazy = false,
  },
  {                                                               -- Alpha
    "goolord/alpha-nvim",
    lazy = false,
    config = function()
      -- For 'Yggdroot/indentLine' and 'lukas-reineke/indent-blankline.nvim' "
      vim.g.indentLine_fileTypeExclude = { 'dashboard' }
      -- For 'ntpeters/vim-better-whitespace' "
      vim.g.better_whitespace_filetypes_blacklist = { 'dashboard' }

      local path_ok, alpha = pcall(require, "alpha")
      if not path_ok then
        return
      end

      local path_ok1, plenary_path = pcall(require, "plenary.path")
      if not path_ok1 then
        return
      end

      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")
      local db = require('dashboard')
      local cdir = vim.fn.getcwd()
      local if_nil = vim.F.if_nil

      local nvim_web_devicons = {
        enabled = true,
        highlight = true,
      }

      local function get_extension(fn)
        local match = fn:match("^.+(%..+)$")
        local ext = ""
        if match ~= nil then
          ext = match:sub(2)
        end
        return ext
      end

      local function icon(fn)
        local nwd = require("nvim-web-devicons")
        local ext = get_extension(fn)
        return nwd.get_icon(fn, ext, { default = true })
      end

      local function file_button(fn, sc, short_fn)
        short_fn = short_fn or fn
        local ico_txt
        local fb_hl = {}

        if nvim_web_devicons.enabled then
          local ico, hl = icon(fn)
          local hl_option_type = type(nvim_web_devicons.highlight)
          if hl_option_type == "boolean" then
            if hl and nvim_web_devicons.highlight then
              table.insert(fb_hl, { hl, 0, 3 })
            end
          end
          if hl_option_type == "string" then
            table.insert(fb_hl, { nvim_web_devicons.highlight, 0, 3 })
          end
          ico_txt = ico .. "  "
        else
          ico_txt = ""
        end
        local file_button_el = dashboard.button(sc, ico_txt .. short_fn, "<cmd>e " .. fn .. " <CR>")
        local fn_start = short_fn:match(".*[/\\]")
        if fn_start ~= nil then
          table.insert(fb_hl, { "Comment", #ico_txt - 2, #fn_start + #ico_txt })
        end
        file_button_el.opts.hl = fb_hl
        return file_button_el
      end

      local default_mru_ignore = { "gitcommit" }

      local mru_opts = {
        ignore = function(path, ext)
          return (string.find(path, "COMMIT_EDITMSG")) or (vim.tbl_contains(default_mru_ignore, ext))
        end,
      }

      --- @param start number
      --- @param cwd string optional
      --- @param items_number number optional number of items to generate, default = 5
      local function mru(start, cwd, items_number, opts)
          opts = opts or mru_opts
          items_number = if_nil(items_number, 5)

          local oldfiles = {}
          for _, v in pairs(vim.v.oldfiles) do
          if #oldfiles == items_number then
            break
          end
          local cwd_cond
          if not cwd then
            cwd_cond = true
          else
            cwd_cond = vim.startswith(v, cwd)
          end
          local ignore = (opts.ignore and opts.ignore(v, get_extension(v))) or false
          if (vim.fn.filereadable(v) == 1) and cwd_cond and not ignore then
            oldfiles[#oldfiles + 1] = v
          end
          end
          local target_width = 39

          local tbl = {}
          for i, fn in ipairs(oldfiles) do
          local short_fn
          if cwd then
            short_fn = vim.fn.fnamemodify(fn, ":.")
          else
            short_fn = vim.fn.fnamemodify(fn, ":~")
          end

          if #short_fn > target_width then
            short_fn = plenary_path.new(short_fn):shorten(1, { -2, -1 })
            if #short_fn > target_width then
              short_fn = plenary_path.new(short_fn):shorten(1, { -1 })
            end
          end

          local shortcut = tostring(i + start - 1)

          local file_button_el = file_button(fn, shortcut, short_fn)
          tbl[i] = file_button_el
          end
          return {
          type = "group",
          val = tbl,
          opts = {},
          }
      end

      local default_header = {
          type = "text",
          val = {
          [[                            ]],
          [[                                                        ]],
          [[ ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗ ]],
          [[ ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║ ]],
          [[ ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║ ]],
          [[ ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║ ]],
          [[ ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║ ]],
          [[ ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝ ]],
          [[                        Welcome                       ]],
          [[                            ]],
          },
          opts = {
              position = "center",
              hl = "Type",
              -- wrap = "overflow";
          },
      }

      local section_mru = {
          type = "group",
          val = {
              {
                  type = "text",
                  val = "Recent files",
                  opts = {
                      hl = "SpecialComment",
                      shrink_margin = false,
                      position = "center",
                  },
              },
          { type = "padding", val = 1 },
              {
                type = "group",
                val = function()
                  return { mru(0, cdir) }
                end,
                opts = { shrink_margin = false },
              },
          },
      }

      local buttons = {
          type = "group",
          val = {
              { type = "text", val = "Comands", opts = { hl = "SpecialComment", position = "center" } },
              { type = "padding", val = 1 },
              dashboard.button("e", " -> New File", ":ene<CR>"),
              dashboard.button("SPC H", " -> Complete History",":Telescope oldfiles<CR>"),
              dashboard.button("f f", " -> Find File",":Telescope find_files<CR>"),
              dashboard.button("F"," -> File Browser",":RnvimrToggle<CR>"),
              dashboard.button("SPC S", " -> Find Word",":Telescope live_grep<CR>"),
              dashboard.button("L","󰒲 -> Lazy", ":Lazy<CR>"),
              dashboard.button("M","󰟾 -> Mason", ":Mason<CR>"),
              dashboard.button("init.lua"," -> Configuration", ":e /home/vhbb/.config/nvim/init.lua<CR>"),
              dashboard.button("c h"," -> Checkhealth", ":checkhealth<CR>"),
              dashboard.button("Q", " -> Quit",":q<CR>"),
          },
          position = "center",
      }

      local end_text = {
          type = "text",
          val = {
              [[                            ]],
              [[I'm more what I think of my self, I really have to be...]],
          },
          opts = {
          position = "center",
          hl = "Number",
        },
      }

      -- dashboard.section.footer.val = {
      --     [[]],
      --     [[       I'm more what I think of my self, I really have to be...      ]],
      -- }

      local config = {
          layout = {
          { type = "padding", val = 1 },
          default_header,
          { type = "padding", val = 2 },
          section_mru,
          { type = "padding", val = 2 },
          buttons,
          { type = "padding", val = 1 },
          end_text,
          { type = "padding", val = 0 },
          },
          opts = {
          margin = 5,
          setup = function()
            vim.cmd("autocmd alpha_temp DirChanged * lua require('alpha').redraw()")
          end,
      },
      }


      alpha.setup(config)

      local home = os.getenv('HOME')
      -- local db = require('dashboard')
      db.preview_command = 'cat | lolcat -F 0.3'
      --db.preview_file_path = home .. '/.config/nvim/static/neovim.cat'
      db.preview_file_height = 12
      db.preview_file_width = 80
      db.hide_statusline = false
      db.hide_tabline    = true
    end,
  },
}
-- db.custom_header= {
--  [[ ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗ ]],
--  [[ ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║ ]],
--  [[ ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║ ]],
--  [[ ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║ ]],
--  [[ ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║ ]],
--  [[ ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝ ]],
--  [[                                                        ]],
--  [[                       Welcome                          ]],
--  [[                         🐬                             ]],
--  [[                                                       ]],
--  [[                                                       ]],
--  [[                                                       ]],
--  [[]],
--  [[                                                        ]],
-- }
-- dashboard.section.header.val = {
--     "[[]],
--     "[[                                                                   ]],
--     "[[      ████ ██████           █████      ██                    ]],
--     "[[     ███████████             █████                            ]],
--     "[[     █████████ ███████████████████ ███   ███████████  ]],
--     "[[    █████████  ███    █████████████ █████ ██████████████  ]],
--     "[[   █████████ ██████████ █████████ █████ █████ ████ █████  ]],
--     "[[ ███████████ ███    ███ █████████ █████ █████ ████ █████ ]],
--     "[[██████  █████████████████████ ████ █████ █████ ████ ██████]],
--     "[[]],
-- }
--
--dashboard.section.buttons.val = {
--     dashboard.button("e", " -> New file", ":ene<CR>"),
--     dashboard.button("SPC h", " -> Recently opened files", ":Telescope oldfiles<CR>"),
--     dashboard.button("f f", " -> Find file",":Telescope find_files<CR>"),
--     dashboard.button("F"," -> File Browser",":RnvimrToggle<CR>"),
--     dashboard.button("SPC s", " -> Find word",":Rg<CR>"),
--     dashboard.button("p l"," -> Plug Update", ":PlugUpdate<CR>"),
--     dashboard.button("p a"," -> Packer Update", ":PackerSync<CR>"),
--     dashboard.button("init.vim"," -> Configuration", ":e /home/vhbb/.config/nvim/init.vim<CR>"),
--     dashboard.button("Q", " -> Quit",":q<CR>"),
-- }
-- dashboard.section.footer.val = {
--     [[]],
--     [[       I'm more what I think of my self, I really have to be...      ]],
-- }
