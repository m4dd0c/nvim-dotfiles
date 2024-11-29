return {
  "stevearc/conform.nvim",
  event = { "BufWritePre", "BufNewFile" },
  -- This will provide type hinting with LuaLS
  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
    formatters = {
      prettier = {
        command = "prettier",
        args = { "--stdin-filepath", "$FILENAME" },
        stdin = true,
      },
      eslint = {
        command = "eslint",
        args = { "--stdin", "--stdin-filename", "$FILENAME", "--fix" },
        stdin = true,
      },
    },
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { "prettier", "eslint" },
      typescript = { "prettier", "eslint" },
      typescriptreact = { "prettier", "eslint" },
      javascriptreact = { "prettier", "eslint" },
      yaml = { "prettier" },
      toml = { "prettier" },
      markdown = { "prettier" },
      json = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      shell = { "shfmt" },
    },
    -- Set default options
    default_format_opts = {
      lsp_format = "fallback",
      lsp_fallback = true,
    },
  },
}
