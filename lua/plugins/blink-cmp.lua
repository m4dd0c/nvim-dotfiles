return {
  "saghen/blink.cmp",

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      -- set to 'none' to disable the 'default' preset
      preset = "default",

      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },

      -- disable a keymap from the preset
      ["<C-e>"] = {},

      -- show with a list of providers
      ["<A-;>"] = {
        function(cmp)
          cmp.show({ providers = { "snippets" } })
        end,
      },

      -- control whether the next command will be run when using a function
      ["<C-n>"] = {
        function(cmp)
          if some_condition then
            return
          end -- runs the next command
          return true -- doesn't run the next command
        end,
        "select_next",
      },
    },
  },
}
