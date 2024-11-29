local lspconfig = require("lspconfig")

-- Function to check if we're in a node_modules directory
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
local on_attach = function(client)
  -- Detach client if in node_modules
  if is_in_node_modules(vim.fn.expand("%:p")) then
    client.stop()
  end
end

-- TypeScript (ts_ls) configuration
lspconfig.ts_ls.setup({
  on_attach = on_attach,
  root_dir = custom_root_dir,
  capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
})

-- ESLint configuration
lspconfig.eslint.setup({
  on_attach = on_attach,
  root_dir = custom_root_dir,
  capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
})

-- TailwindCSS configuration
lspconfig.tailwindcss.setup({
  on_attach = on_attach,
  root_dir = custom_root_dir,
  capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
})
return lspconfig
