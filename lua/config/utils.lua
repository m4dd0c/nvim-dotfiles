-- Creates a custom Neovim user command `:Dashboard` that triggers the `dashboard` function
vim.api.nvim_create_user_command("Dashboard", function()
  require("snacks").dashboard()
end, {})

-- Global utility function `P` for pretty-printing a table or any value using `vim.inspect`.
-- @param tab (table|any) The value to pretty-print. Defaults to an empty table.
-- @return The input value, unchanged.
P = function(tab)
  tab = tab or {}
  print(vim.inspect(tab))
  return tab
end

-- Global utility function `R` for reloading a Lua module.
-- This clears the module from the `package.loaded` cache and re-requires it.
-- Useful for development to reload changes in a module without restarting Neovim.
-- @param name (string) The name of the module to reload.
-- @return The reloaded module.
R = function(name)
  package.loaded[name] = nil
  return require(name)
end
