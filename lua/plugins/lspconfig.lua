return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      eslint = {
        on_attach = function(client, bufnr)
          if client.server_capabilities.documentFormattingProvider then
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              command = "EslintFixAll",
            })
          end
        end,
      },
    },
  },
}
