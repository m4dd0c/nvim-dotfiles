-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- before saving the files run 'x' command
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = { "*.js", "*.jsx", "*.ts", "*.tsx" }, -- Add other file types if needed
--   callback = function()
--     vim.cmd("EslintFixAll")
--   end,
-- })

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client_id = args.data.client_id
    local buf = args.buf
    local file_path = vim.api.nvim_buf_get_name(buf)

    -- detach LSP client for files inside node_modules
    if string.match(file_path, "node_modules") then
      vim.lsp.buf_detach_client(buf, client_id)
      return
    end
  end,
})
