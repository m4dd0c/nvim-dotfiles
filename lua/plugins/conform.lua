return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = {
          command = "C:\\Users\\Manish Suthar\\AppData\\Local\\nvim-data\\mason\\bin\\stylua.CMD",
          args = { "--config-path", "C:\\Users\\Manish Suthar\\AppData\\Local\\nvim\\stylua.toml" }, -- adjust args as needed
        },
        javascript = {
          command = '"C:\\Users\\Manish Suthar\\AppData\\Local\\nvim-data\\mason\\bin\\prettier.CMD"',
          args = { "--stdin-filepath", "%filepath" }, -- specify file path argument
          stdin = true,                               -- enables standard input for Prettier
        },
        typescript = {
          command = '"C:\\Users\\Manish Suthar\\AppData\\Local\\nvim-data\\mason\\bin\\prettier.CMD"',
          args = { "--stdin-filepath", "%filepath" },
          stdin = true,
        },
      },
    },
  },
}
