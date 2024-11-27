return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  opts = {
    popup_border_style = "rounded",
    default_component_configs = {
      icon = {
        folder_closed = "󰉋",
      },
      indent = {
        with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
        expander_collapsed = "󱞩",
        expander_expanded = "󱞩",
        expander_highlight = "NeoTreeExpander",
        with_markers = false,
        indent_marker = "󱞩",
        last_indent_marker = "󱞩",
      },
      git_status = {
        symbols = {
          added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
          modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
          -- Status type
          unstaged = "",
          staged = "󰄴",
          untracked = "󱠇",
          ignored = "",
          conflict = "",
          deleted = "",
          renamed = "➜",
        },
      },
    },
    -- showing hidden files by default
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_hidden = false,
        hide_gitignored = false,
        visible = true,
        hide_by_filename = { ".DS_Store", "node_modules" },
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
