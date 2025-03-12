return {
  "saghen/blink.cmp",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      -- Set the keymap preset to 'enter' to accept completions with <Enter>
      preset = "enter",

      -- Retain your existing key mappings
      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },

      -- Show a list of providers
      ["<A-;>"] = {
        function(cmp)
          cmp.show({ providers = { "snippets" } })
        end,
      },

      -- Control whether the next command will be run when using a function
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
