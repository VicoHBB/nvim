return {
  'pianocomposer321/yabs.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  config = function ()
    require('yabs'):setup({
      languages = { -- List of languages in vim's `filetype` format
        lua = {
          tasks = {
            run = {
              command = 'luafile %', -- The command to run (% and other
              -- wildcards will be automatically
              -- expanded)
              type = 'vim',  -- The type of command (can be `vim`, `lua`, or
              -- `shell`, default `shell`)
            },
          },
        },
        c = {                                                             --C
          default_task = 'Warning',
          tasks = {
            CMakeRun = {
              command = './Build_Release/app/Executable',
              output = 'terminal',
            },
            Make = {
              command = 'make all',
              output = 'quickfix',
            },
            MISRA = {
              command = 'make misra_test',
              output = 'quickfix',
            },
            Warning = {
              command = 'cowsay "User CMakeTools or Make commands"',
              output = 'quickfix',
            } ,
          },
        },
        cpp = {                                                           --CPP
          default_task = 'Warning',
          tasks = {
            Make = {
              command = 'make all',
              output = 'quickfix',
            },
            Warning = {
              command = 'cowsay " User CMakeTools or Make commands"',
              output = 'quickfix',
            } ,
            CMakeRun = {
              command = './Build_Release/app/Executable',
              output = 'terminal',
            }
          },
        },
        python = {                                                    -- Python
          default_task = 'Run',
          tasks = {
            Run = {
              command = 'Python -u',
              output = 'quickfix',
            },
            REPL = {
              command = 'ipython --no-autoindent',
              output = 'terminal',
            },
            uPython_Clean = {
              command = 'make clean',
              output = 'quickfix',
            },
            uPython_Flash = {
              command = 'make flash',
              output = 'quickfix',
            },
            uPython_List = {
              command = 'make list',
              output = 'quickfix',
            },
            uPython_Run = {
              command = 'make all',
              output = 'quickfix',
            },
            uPython_Reset= {
              command = 'make rs',
              output = 'quickfix',
            },
            uPython_REPL = {
              command = 'make repl',
              output = 'terminal',
            },
          },
        },
        systemverilog = {
          default_task = 'Verilating_and_Simulate',
          tasks = {
            Clean = {
              command = 'make clean',
              output = 'quickfix',
            },
            Simulate = {
              command = 'make run',
              output = 'quickfix',
            },
            Quartus_Tools = {
              command = 'make qrtl',
              output = 'quickfix',
            },
            Verilating_and_Simulate = {
              -- is a lua function
              command = function()
                require('yabs'):run_task('Verilating', {
                  on_exit = function(Job, exit_code)
                    if exit_code == 0 then
                      require('yabs').languages.systemverilog:run_task('Simulate')
                    end
                  end,
                })
              end,
              type = 'lua',
            },
            Verilating = {
              command = 'make all',
              output = 'quickfix',
            },
            Synthesis_and_analysis = {
              command = 'make synth',
              output = 'quickfix',
            },
            Generate_Netlist = {
              command = 'make net',
              output = 'quickfix',
            },
            Yosys = {
              command = 'make ys',
              output = 'quickfix',
            },
            RTLViewer = {
              command = 'make view',
              output = 'quickfix',
            },
          },
        },
      },
      verilog = systemverilog,
      tasks = { -- Same values as `language.tasks`, but global
        Make = {
          command = 'make all',
          output = 'quickfix',
        },
        Run = {
          command = 'make run',
          output = 'quickfix',
        },
        Clean = {
          command = 'make clean',
          output = 'quickfix',
        },
        optional = {
          command = 'echo runs on condition',
          -- You can specify a condition which determines whether to enable a
          -- specific task
          -- It should be a function that returns boolean,
          -- not a boolean directly
          -- Here we use a helper from yabs that returns such function
          -- to check if the files exists
          condition = require('yabs.conditions').file_exists('filename.txt'),
        },
      },
      opts = { -- Same values as `language.opts`
        output_types = {
          quickfix = {
            open_on_run = 'always',
          },
        },
      },
    })
  end
}
