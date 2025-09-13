vim.opt.termguicolors = true

require("bufferline").setup {
    options = {
        -- use nvim default lsp
        diagnostics = "nvim_lsp",
        -- leave space in the left for nvim-tree
        offsets = {{
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left"
        }}
    }
}
