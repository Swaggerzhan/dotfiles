return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "bash",
                "c",
                "cpp",
                "go",
                "lua",
                "python",
                "vim",
                "vimdoc",
                "bash",
            },
            auto_install = false,
            indent = {
                enable = false,
            },
            incremental_selection = {
                enable = false,
            },
            highlight = {
                enable = true,
                -- disable in big files to avoid lag
                disable = function(lang, buf)
                    local max_filesize = 200 * 1024 -- 200 KB
                    local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,
            },
        },
        lazy = false,
    },
}

-- if compare failed, try this one
-- install cargo:
-- curl https://sh.rustup.rs -sSf | sh
-- then install tree-sitter-cli by specific version
-- argo install tree-sitter-cli --version 0.25.0

