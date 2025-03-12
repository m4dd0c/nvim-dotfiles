return {
  "saghen/blink.cmp",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = "enter", -- Using the "enter" preset for <Enter> confirmation

      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },

      -- Explicitly define <C-n> to select the next item
      ["<C-n>"] = { "select_next", "fallback" },
      -- Optionally, define <C-p> explicitly as well (if needed)
      ["<C-p>"] = { "select_prev", "fallback" },

      ["<A-;>"] = {
        function(cmp)
          cmp.show({ providers = { "snippets" } })
        end,
      },
    },
  },
}
