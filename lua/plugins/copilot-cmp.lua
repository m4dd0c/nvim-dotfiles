return {
  "zbirenbaum/copilot-cmp",
  enabled = true,
  cmd = "Copilot",
  event = "InsertEnter",
  opts = {
    suggestion = { enabled = true, auto_trigger = true, keymap = { accept = "<Tab>" } },
    panel = { enabled = false },
  },
}
