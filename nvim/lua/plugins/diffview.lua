return {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    keys = {
        { "<leader>go", "<cmd>DiffviewOpen<cr>", desc = "DiffView" },
        -- { "<leader>gH", "<cmd>DiffviewFileHistory %<cr>", desc = "File History" },
    },
    opts = {
        enhanced_diff_hl = true, -- Better syntax highlighting in diffs
    },
}
