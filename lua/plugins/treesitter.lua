require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "cpp", "go", "python", "bash"},
    
    incremental_selection = {
        enable = false,
    },
    
    highlight = {
        enable = true,
        -- disable this feature in big file, that's fucking laggy
        disable = function(lang, buf)
            local max_filesize = 200 * 1024 -- 200 KB
            local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))  -- 修改这行
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
    },
    
    indent = {
        enable = false,
    },
}
