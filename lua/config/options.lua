-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- number
opt.number = true
opt.relativenumber = false

-- table
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.modeline = false

opt.wrap = false

opt.cursorline = true
opt.colorcolumn = "85"
opt.scrolloff = 7
opt.mouse = ""

-- disable auto format
vim.g.autoformat = false
