return {
  "stevearc/conform.nvim",
  event = { "BufWritePre", "BufNewFile" },
  -- This will provide type hinting with LuaLS
  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      javascriptreact = { "prettier" },
      yaml = { "prettier" },
      toml = { "prettier" },
      markdown = { "prettier" },
      json = { "prettier" },
      shell = { "shfmt" },
    },
    -- Set default options
    default_format_opts = {
      lsp_format = "fallback",
    },
  },
}
