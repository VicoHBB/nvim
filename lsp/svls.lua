---@brief
---
--- https://github.com/dalance/svls
---
--- Language server for verilog and SystemVerilog
---
--- `svls` can be installed via `cargo`:
---  ```sh
---  cargo install svls
---  ```
return {
  cmd = { 'svls', "-d" },
  filetypes = { 'verilog', 'systemverilog' },
  root_markers = {
                '.git',
                '.gitignore',
                '.svlint.toml',
                '.svls.toml'
  },
}
