return {
    "navarasu/onedark.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
        require("onedark").setup({
            style = "darker",
            transparent = true,
            highlights = {
                -- ["@variable"] = { fg = "#fcfcfc" },
                ["@lsp.type.variable"] = { fg = "#fcfcfc" },
            },
        })
        require("onedark").load()
    end,
}
