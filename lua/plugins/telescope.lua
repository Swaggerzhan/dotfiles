-- return {
--     {
--         "nvim-telescope/telescope.nvim",
--         keys = {
--             { "<leader>fl", "<cmd>Telescope live_grep<cr>", desc = "Find Line (grep)" },
--             { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File" },
--             { "<leader>fr", "<cmd>Telescope resume<cr>", desc = "Find Resume" },
--         },
--         opts = function(_, opts)
--             opts.defaults = opts.defaults or {}
--             opts.defaults.initial_mode = "normal"
--         end,
--     },
-- }

return {
    {
        "nvim-telescope/telescope.nvim",
        keys = {
            { "<leader>fl", "<cmd>Telescope live_grep<cr>", desc = "Find Line (grep)" },
            { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File" },
            { "<leader>fr", "<cmd>Telescope resume<cr>", desc = "Find Resume" },
        },
        opts = function(_, opts)
            opts.defaults = opts.defaults or {}
            opts.defaults.initial_mode = "normal"
            -- Force Case Sensitive
            opts.defaults.vimgrep_arguments = {
                "rg",
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--case-sensitive", -- This enables strict case sensitivity
            }
        end,
    },
}

