-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

local lspconfig = require("lspconfig")

-- Define a function to toggle ESLint based on the current working directory
local function toggle_eslint()
  -- Convert the current working directory to lowercase
  local cwd = vim.fn.getcwd():lower()

  -- Check if the current directory includes 'frontend' or 'client' (case-insensitive)
  if cwd:match("frontend") or cwd:match("client") then
    lspconfig.eslint.setup({})
  -- Check if the current directory includes 'backend' or 'server' (case-insensitive)
  elseif cwd:match("backend") or cwd:match("server") then
    -- If ESLint was previously started, stop it
    if lspconfig.eslint then
      lspconfig.eslint.manager.try_shutdown()
    end
  end
end

-- Run the toggle function when opening a new buffer or switching projects
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = "*",
  callback = toggle_eslint,
})
