return {
    "folke/snacks.nvim",
    opts = {
        picker = {
            cycle = false,
            sources = {
                explorer = {
                    -- wrap = false,
                    remember = true,
                    git = {
                        enabled = false,
                    },
                    win = {
                        input = {
                            keys = {
                                ["<Esc>"] = false, -- disable Esc in input field
                            },
                        },
                        list = {
                            keys = {
                                ["<Esc>"] = false, -- disable Esc in results list
                                ["<CR>"] = "confirm", -- Disable <CR>
                                ["o"] = { { "pick_win", "jump" }, mode = { "n", "i" } },
                            },
                        },
                    },
                },
            },
        },
    },
    keys = {
        {
            "<leader>o",
            function()
                Snacks.picker.explorer()
            end,
            desc = "Explorer",
        },
        { "<leader>e", false },
    },
}
