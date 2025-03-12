return {
  "chrisgrieser/nvim-recorder",
  enabled = true,
  dependencies = {
    "rcarriga/nvim-notify"
  },
  -- event = "VeryLazy",
  opts = {

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
    lessNotifications = false,
    -- Clears all macros-slots on startup.
    clear = true,
  },
  keys = {
    -- these must match the keys in the mapping config below
    { "q", desc = " Start Recording" },
    { "@", desc = " Play Recording" },
    { "<C-q>", desc = "Switch Slot Macro" },
    { "cq", desc = "Change Macro" },
    { "dq", desc = "Delete All Macros" },
    { "yq", desc = "Yank Macro" },
    -- { "##", desc = "Add Break Point" },
  },
}
