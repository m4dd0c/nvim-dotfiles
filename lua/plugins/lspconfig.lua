local lspconfig = require("lspconfig")

local function is_in_node_modules(path)
  return path:match("node_modules")
end

-- Root dir for tsserver, eslint, tailwindcss
local function custom_root_dir(fname)
  local root = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git")(fname)
  if root and is_in_node_modules(fname) then
    return nil -- Detach if we're inside node_modules
  end
  return root
end

-- Common on_attach function for performance optimization
local on_attach = function(client, bufnr)
  local file_path = vim.api.nvim_buf_get_name(bufnr)
  -- Detach client if in node_modules
  if is_in_node_modules(file_path) then
    -- Working good, however stops client that doesn't start again.
    -- client.stop()
    vim.lsp.buf_detach_client(bufnr, client.id)
    vim.diagnostic.enable(false, { bufnr = bufnr })
  end
end

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      eslint = {
        settings = {
          workingDir = {
            mode = "auto",
          },
        },
        on_attach = on_attach,
        root_dir = custom_root_dir,
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      },
      ts_ls = {
        on_attach = on_attach,
        root_dir = custom_root_dir,
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      },
      tailwindcss = {
        on_attach = on_attach,
        root_dir = custom_root_dir,
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      },
    },
  },
}
