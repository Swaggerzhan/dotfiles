-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

keymap.set("n", "<leader>gg", "<cmd>EnableBlame<cr>", { desc = "Git Blame" })
keymap.set("n", "<leader>ggc", "<cmd>DisableBlame<cr>", { desc = "Git Blame Off" })
keymap.set("n", "<leader>ds", "<cmd>Noice dismiss<cr>", { desc = "Dismiss Notifications" })

