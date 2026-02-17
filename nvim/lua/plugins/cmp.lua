return {
    {
        "hrsh7th/nvim-cmp",
        opts = function(_, opts)
            opts.sources = vim.tbl_filter(function(source)
                return source.name ~= "luasnip"
            end, opts.sources or {})
        end,
    },
    -- Also disable the snippet plugin itself
    { "L3MON4D3/LuaSnip", enabled = false },
    { "rafamadriz/friendly-snippets", enabled = false },
}
