-- Keymaps are auomatically loaded on the VeryLazy event
--Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local opts = { silent = false, noremap = true }
local t_opts = { silent = true }
local keymap = vim.keymap

-- Enter normal mode in terminal
keymap.set("t", "jj", [[<C-\><C-n>]], t_opts)

-- Saving on jk
keymap.set("i", "jk", "<cmd>w<cr><ESC>", opts)

-- Enter normal mode
keymap.set("i", "jj", "<ESC>", opts)
keymap.set("i", "JJ", "<ESC>", opts)

-- Go to single char ahead in insertmode
keymap.set("i", "kk", "<C-o>a", opts)

-- Go to end of line in insertmode
keymap.set("i", "KK", "<C-o>A", opts)

-- greatest remap
keymap.set("x", "p", [["_dP]])

-- Jumplist
keymap.set("n", "<C-m>", "<C-o>", opts)

-- Restart LSP when backslash pressed twice
keymap.set("n", "\\\\", "<cmd>LspRestart<cr>", opts)

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G", opts)

-- Split window
keymap.set("n", "ss", ":vsplit<Return>", opts)

-- Go to window
keymap.set("n", "sh", "<C-w>h", opts)
keymap.set("n", "sj", "<C-w>j", opts)
keymap.set("n", "sk", "<C-w>k", opts)
keymap.set("n", "sl", "<C-w>l", opts)

-- Flash jump mode s -> ;
keymap.set("n", ";", "<cmd>lua require('flash').jump()<cr>", opts)
keymap.set("x", ";", "<cmd>lua require('flash').jump()<cr>", opts)

-- Tabs
keymap.set("n", "te", ":tabedit<Return>", opts)
keymap.set("n", "td", ":tabclose<Return>", opts)
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<S-tab>", ":tabprev<Return>", opts)

-- Delete current buffer
keymap.set("n", "ff", function()
  require("snacks.bufdelete").delete()
end, opts)

-- Delete all buffer
keymap.set("n", "fa", function()
  require("snacks.bufdelete").all()
end, opts)

-- Go to previously opened buffer
keymap.set("n", "fd", "<cmd>b#<cr>", opts)

-- Diagnostics
-- See diagnostic, since K used for hover, J makes sense
keymap.set("n", "J", vim.diagnostic.open_float, opts)

-- goto diagnostic
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)

-- todo finder
keymap.set("n", "<leader>t", "<cmd>TodoTelescope<cr>", opts)

-- for html-live-server
keymap.set("n", "<leader>hs", ":LiveServerStart<CR>", opts) -- start-live-server
keymap.set("n", "<leader>he", ":LiveServerStop<CR>", opts) -- stop/end-live-server

-- for markdown-live-server
keymap.set("n", "<leader>ms", ":MarkdownPreview<CR>", opts) -- start-live-server
keymap.set("n", "<leader>me", ":MarkdownPreviewStop<CR>", opts) -- stop/end-live-server
keymap.set("n", "<leader>mit", ":MDInsertToc<CR>", opts) -- Insert Table of content
keymap.set("n", "<leader>mil", ":MDListItemBelow<CR>", opts) -- Insert a list item below
keymap.set("n", "<leader>mct", ":MDTaskToggle<CR>", opts) -- toggle checkbox
keymap.set("n", "<leader>mcn", ":MDResetListNumbering<CR>", opts) -- Fix list numbering

-- C++ code runner in LazyVim
keymap.set("n", "<leader>r", ":term g++ % -o %:r && %:r.exe<CR>", opts)

-- EslintFixAll
keymap.set("n", "F", ":EslintFixAll<CR>", opts)
