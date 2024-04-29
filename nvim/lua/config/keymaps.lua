-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap.set
local opts = { silent = true }

keymap("n", ";", ":", opts)
keymap({ "n", "v" }, "<leader>fm", function()
  LazyVim.format({ force = true })
end, { desc = "Format" })
