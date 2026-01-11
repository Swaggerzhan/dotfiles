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
        end,
    },
}
