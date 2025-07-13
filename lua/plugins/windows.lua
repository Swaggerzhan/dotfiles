require('windows').setup({
    autowidth = {
        enable = false,
    },
    ignore = {
        buftype = { "quickfix" },
        filetype = { "NvimTree", "neo-tree", "undotree", "gundo" }
    },
})
