return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    picker = {
      enabled = true,
      hidden = true,
      sources = {
        explorer = {
          layout = {
            layout = {
              position = "right", -- Position the explorer on the right
              width = 30,
            },
          },
        },
      },
    },
    explorer = {
      position = "right",
      width = 0.5,
      relative = "editor",
    },
    notifier = {
      enabled = true,
      timeout = 5000,
    },
    quickfile = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    scroll = {},
    ---@type table<string, snacks.win.Config>
    styles = {
      notification = {
        wo = { wrap = true },
        relative = "editor",
      },
    },
  },
  keys = {
    {
      "sd",
      function()
        Snacks.notifier.hide()
      end,
      desc = "Dismiss All Notifications",
    },
    {
      "sh",
      function()
        Snacks.notifier.show_history()
      end,
      desc = "Show Notifications history",
    },
  },
}
