local M = {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
  },
  event = { "InsertEnter" },
}
local kind_icons = {
  Text = "",
  Method = "󰆧",
  Function = "󰊕",
  Constructor = "",
  Field = "",
  Variable = "󰀫",
  Class = "󰠱",
  Interface = "",
  Module = "",
  Property = "󰜢",
  Unit = "󰑭",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "󰈙",
  Reference = "",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "󰏿",
  Struct = "󰙅",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "󰅲",
  Codeium = "",
}

M.config = function()
  local cmp = require("cmp")
  vim.opt.completeopt = { "menu", "menuone", "noselect" }

  cmp.setup({
    window = {
      documentation = cmp.config.window.bordered(),
      completion = {
        winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
        col_offset = -3,
        side_padding = 0,
        max_width = 60,
      },
    },
    formatting = {
      expandable_indicator = true,
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        -- setting width of the suggestion window
        vim_item.abbr = string.sub(vim_item.abbr, 1, 30)

        -- Adding parentheses for kind name in menu
        vim_item.menu = " (" .. (vim_item.kind or "Unknown") .. ")"

        -- Get the icon for the completion kind
        -- If icon not available set a default one
        -- Surround w/ spaces for padding, So that bg-color look good (config.colorscheme)
        local kind_icon = " " .. kind_icons[vim_item.kind] or "" .. " "
        vim_item.kind = kind_icon .. " "

        return vim_item
      end,
    },
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    -- mapping
    mapping = cmp.mapping.preset.insert({
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<A-;>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "nvim_lua" },
      { name = "luasnip" }, -- For luasnip users.
    }, {
      { name = "buffer" },
      { name = "path" },
    }, {}),
  })
end

return M
