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
        -- Your existing keys
        {
            "<leader>o",
            function()
                Snacks.picker.explorer()
            end,
            desc = "Explorer",
        },
        { "<leader>e", false },
        -- Disable the specific Git shortcuts you listed
        { "<leader>gD", false },
        { "<leader>gf", false },
        { "<leader>gi", false },
        { "<leader>gI", false },
        { "<leader>gl", false },
        { "<leader>gL", false },
        { "<leader>gp", false },
        { "<leader>gP", false },
        { "<leader>gs", false },
        { "<leader>gS", false },
        { "<leader>gY", false },
        { "<leader>gh", false },
        { "<leader>gb", false },
        { "<leader>gB", false },
        { "<leader>gd", false },
    },
}

