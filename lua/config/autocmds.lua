-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- vim.cmd([[colorscheme onedark]])

-- disable auto comment
vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        vim.opt.formatoptions:remove({ "c", "r", "o" })
    end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
        vim.api.nvim_set_hl(0, "SnacksIndentScope", normal)
        -- set all git status to same color
        for _, name in ipairs({ "Added", "Changed", "Deleted", "Renamed", "Untracked", "Ignored" }) do
            vim.api.nvim_set_hl(0, "Snacks" .. name, normal)
        end
    end,
})
