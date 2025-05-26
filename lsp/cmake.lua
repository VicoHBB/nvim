---@brief
---
--- https://github.com/regen100/cmake-language-server
---
--- CMake LSP Implementation
return {
  cmd = { 'cmake-language-server' },
  filetypes = { 'cmake' },
  root_markers = { 'CMakePresets.json', 'CTestConfig.cmake', '.git', 'build', 'cmake' },
  init_options = {
        init_options = {
            buildDirectory = 'build',
        },
        -- buildDirectory = function()
        --     local osys = require("cmake-tools.osys")
        --     require("cmake-tools.osys")
        --     if osys.iswin32 then
        --         return "out\\${variant:buildType}"
        --     end
        --     return "out/${variant:buildType}"
        -- end,
  },
}
