-- minimal config for lazy-loading with lazy.nvim
return {
  "chrisgrieser/nvim-recorder",
  dependencies = "rcarriga/nvim-notify",
  keys = {
    -- these must match the keys in the mapping config below
    { "q", desc = " Start Recording" },
    { "@", desc = " Play Recording" },
  },
  config = function()

    require("recorder").setup({
      slots = { "a", "s", "d" },
      mapping = {
        startStopRecording = "q",
        playMacro = "@",
        switchSlot = "<C-q>",
        editMacro = "cq",
        deleteAllMacros = "dq",
        yankMacro = "yq",
        -- ⚠️ this should be a string you don't use in insert mode during a macro
        addBreakPoint = "##",
      },
      lessNotifications = true,
      -- Clears all macros-slots on startup.
      clear = true,
    })

  end,
}

