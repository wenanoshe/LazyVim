-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

local opts = { noremap = true, silent = true }

-- Exit insert mode by pressing 'j' twice quickly
map("i", "jk", "<Esc>", opts)

-- Move around in insert mode
map("i", "<C-h>", "<Left>", opts)
map("i", "<C-l>", "<Right>", opts)
map("i", "<C-j>", "<Down>", opts)
map("i", "<C-k>", "<Up>", opts)

-- Telescope LSP symbol search
map("n", "gs", function()
  Snacks.picker.lsp_symbols({ filter = LazyVim.config.kind_filter })
end, { desc = "LSP Symbols" })

map("n", "<leader>;", "$a;<Esc>", opts)

-- Search for visually selected text with *
vim.keymap.set("v", "/", function()
  local saved_reg = vim.fn.getreg("s")
  vim.cmd('normal! "sy') -- Yank visual selection to register s
  local search = vim.fn.escape(vim.fn.getreg("s"), "\\/.*$^~[]")
  vim.fn.setreg("/", search) -- Set it as search pattern
  vim.fn.setreg("s", saved_reg) -- Restore register
  vim.cmd("normal! n") -- Jump to next match
end, { desc = "Search for selection" })
