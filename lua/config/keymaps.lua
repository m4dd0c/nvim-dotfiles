-- Keymaps are auomatically loaded on the VeryLazy event
--Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local opts = { silent = false, noremap = true }
local t_opts = { silent = true }
local keymap = vim.keymap

-- Create a function to generate keymap options, with default values fallback
-- @param description string: Description for the keymap.
-- @param silent string: Determines If user want to show notification of performance.
-- @param noremap string: Determines If keymap can be re-mapped or not.
-- @returns opts: An option table look like following: { desc:string, silent:bool, noremap:bool }
local function gen_opt(description, silent, remap)
  local opts = {
    silent = silent or true,
    noremap = remap or true,
    desc = description or nil,
  }
  return opts
end

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
keymap.set("n", "<leader>t", "<cmd>TodoTelescope<cr>", gen_opt("Find all Todos"))

-- for html-live-server
keymap.set("n", "<leader>h", "<Nop>", gen_opt("HTML Live Server"))
keymap.set("n", "<leader>hs", ":LiveServerStart<CR>", gen_opt("Start HTML Live Server")) -- start-live-server
keymap.set("n", "<leader>he", ":LiveServerStop<CR>", gen_opt("End HTML Live Server")) -- stop/end-live-server

-- for markdown-live-server
keymap.set("n", "<leader>m", "<Nop>", gen_opt("Markdown"))
keymap.set("n", "<leader>ms", ":MarkdownPreview<CR>", gen_opt("Start Markdown Live Preview")) -- start-live-server
keymap.set("n", "<leader>me", ":MarkdownPreviewStop<CR>", gen_opt("End Markdown Live Preview")) -- stop/end-live-server

keymap.set("n", "<leader>mi", "<Nop>", gen_opt("Markdown Insert"))
keymap.set("n", "<leader>mit", ":MDInsertToc<CR>", gen_opt("Insert Markdown TOC", false)) -- Insert Table of content
keymap.set("n", "<leader>mil", ":MDListItemBelow<CR>", gen_opt("Insert Markdown List item")) -- Insert a list item below

keymap.set("n", "<leader>mc", "<Nop>", gen_opt("Markdown Change"))
keymap.set("n", "<leader>mct", ":MDTaskToggle<CR>", gen_opt("Toggle Task Item - [*]")) -- toggle checkbox
keymap.set("n", "<leader>mcn", ":MDResetListNumbering<CR>", gen_opt("Refector List Numbering")) -- Fix list numbering

-- C++ code runner in LazyVim
keymap.set("n", "<leader>r", ":term g++ % -o %:r && %:r.exe<CR>", opts)

-- EslintFixAll
keymap.set("n", "F", ":EslintFixAll && w<CR>", opts)
