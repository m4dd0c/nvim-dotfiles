return {
  {
    "pmizio/typescript-tools.nvim",
    enabled = false,
    requires = { "nvim-lua/plenary.nvim", "nvim-lspconfig" },
    config = function()
      require("typescript-tools").setup({})
    end,
  },
}
