return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    -- showing hidden files by default
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_hidden = false,
        hide_gitignored = false,
        visible = true,
      },
    },
    window = {
      position = "right",
      width = 35,
      mappings = {
        -- disabling s (split view) for better navigation
        ["s"] = "",
        ["v"] = "open_vsplit",
      },
    },
  },
}
