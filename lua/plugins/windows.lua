return {
    {
        "anuvyklack/windows.nvim",
        dependencies = {
            "anuvyklack/middleclass",
            "anuvyklack/animation.nvim",
        },
        event = "VeryLazy",
        keys = {
            { "<C-w>z", "<cmd>WindowsMaximize<cr>", desc = "Maximize Window" },
            -- { "<C-w>e", "<cmd>WindowsEnableAutowidth<cr>", desc = "Enable Autowidth" },
            -- { "<C-w>d", "<cmd>WindowsDisableAutowidth<cr>", desc = "Disable Autowidth" },
        },
        config = function()
            vim.o.winwidth = 5
            vim.o.winminwidth = 5
            vim.o.equalalways = false
            require("windows").setup({
                autowidth = {
                    enable = false,
                },
                ignore = {
                    buftype = { "quickfix" },
                    filetype = { "NvimTree", "neo-tree", "undotree", "gundo" },
                },
            })
        end,
    },
}

