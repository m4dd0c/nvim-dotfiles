return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 5000,
    },
    quickfile = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    styles = {
      notification = {
        wo = { wrap = true },
      },
    },
  },
  keys = {
    {
      "<leader>und",
      function()
        Snacks.notifier.hide()
      end,
      desc = "Dismiss All Notifications",
    },
    {
      "<leader>unh",
      function()
        Snacks.notifier.show_history()
      end,
      desc = "Show Notifications history",
    },
    -- {
    --   "]]",
    --   function()
    --     Snacks.words.jump(vim.v.count1)
    --   end,
    --   desc = "Next Reference",
    --   mode = { "n", "t" },
    -- },
    -- {
    --   "[[",
    --   function()
    --     Snacks.words.jump(-vim.v.count1)
    --   end,
    --   desc = "Prev Reference",
    --   mode = { "n", "t" },
    -- },
  },
}
