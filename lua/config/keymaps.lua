-- Keymaps are auomatically loaded on the VeryLazy event
--Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local opts = { silent = false, noremap = true }
local keymap = vim.keymap

-- saving on jk
keymap.set("i", "jk", "<cmd>w<cr><ESC>", opts)
-- enter normal mode
keymap.set("i", "jj", "<ESC>", opts)
keymap.set("i", "JJ", "<ESC>", opts)

-- goto single char ahead in insertmode
keymap.set("i", "kk", "<C-o>a", opts)

-- goto end of line in insertmode
keymap.set("i", "KK", "<C-o>A", opts)

-- jumplist
keymap.set("n", "<C-m>", "<C-o>", opts)

-- Restart LSP when backslash pressed twice
keymap.set("n", "\\\\", "<cmd>LspRestart<cr>", opts)

-- select all
keymap.set("n", "<C-a>", "gg<S-v>G", opts)

-- split window
keymap.set("n", "ss", ":vsplit<Return>", opts)

-- goto window
keymap.set("n", "sh", "<C-w>h", opts)
keymap.set("n", "sj", "<C-w>j", opts)
keymap.set("n", "sk", "<C-w>k", opts)
keymap.set("n", "sl", "<C-w>l", opts)

-- flash jump mode s -> ;
keymap.set("n", ";", "<cmd>lua require('flash').jump()<cr>", opts)
keymap.set("x", ";", "<cmd>lua require('flash').jump()<cr>", opts)

-- tabs
keymap.set("n", "te", ":tabedit<Return>", opts)
keymap.set("n", "td", ":tabclose<Return>", opts)
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<S-tab>", ":tabprev<Return>", opts)

-- buffer
keymap.set("n", "ff", LazyVim.ui.bufremove, opts)
keymap.set("n", "fd", "<cmd>b#<cr>", opts)

-- Diagnostics
-- see line diagnostic, since K used for hover, J makes sense
keymap.set("n", "J", vim.diagnostic.open_float, opts)

-- goto diagnostic
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)
keymap.set("n", "<C-J>", function()
  vim.diagnostic.goto_prev()
end, opts)

-- todo finder
keymap.set("n", "<leader>t", "<cmd>TodoTelescope<cr>", opts)
