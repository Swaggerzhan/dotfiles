local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    -- My plugins here
    -- use 'foo1/bar1.nvim'
    -- use 'foo2/bar2.nvim'
    -- use {
    --   'foo1/bar1.nvim',
    --   requires = {
    --      'foo2/bar2.nvim',
    --   }
    -- }
    use 'joshdick/onedark.vim'
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
          'nvim-tree/nvim-web-devicons',
        }
    }
    
    use 'nvim-treesitter/nvim-treesitter'
    --use 'p00f/nvim-ts-rainbow'
    use 'HiPhish/rainbow-delimiters.nvim'
    
    -- lsp
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig"
    }
    
    -- cmp
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "L3MON4D3/LuaSnip" -- snippets, if we don't have this, may error
    use "saadparwaiz1/cmp_luasnip"
    use "rafamadriz/friendly-snippets"
    use "hrsh7th/cmp-path" -- 文件路径
    
    use "lvimuser/lsp-inlayhints.nvim" -- for inlay hints
    
    use "akinsho/bufferline.nvim"
    use "lewis6991/gitsigns.nvim" -- git editor prompt
    
    use "akinsho/toggleterm.nvim" -- terminal
    
    use "FabijanZulj/blame.nvim" -- git blame
    use "sindrets/diffview.nvim"  -- git diff
    
    use "lukas-reineke/indent-blankline.nvim" -- indent
    
    -- file search
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        requires = {
            {'nvim-lua/plenary.nvim'},
            { "nvim-telescope/telescope-live-grep-args.nvim" },
        },
        config = function()
            require("telescope").load_extension("live_grep_args")
        end
    }
    
    use { 
        "anuvyklack/windows.nvim",
        requires = {
            "anuvyklack/middleclass",
            "anuvyklack/animation.nvim"
        },
        config = function()
            vim.o.winwidth = 5
            vim.o.winminwidth = 5
            vim.o.equalalways = false
            require('windows').setup()
        end
    }

    use "okuuva/auto-save.nvim"
    use "RRethy/vim-illuminate"
    use 'karb94/neoscroll.nvim'

    -- for avante
    --use {
    --    'yetone/avante.nvim',
    --    branch = 'main',
    --    requires = {
    --        'stevearc/dressing.nvim',
    --        'nvim-lua/plenary.nvim',
    --        'MunifTanjim/nui.nvim',
    --        'MeanderingProgrammer/render-markdown.nvim'
    --    },
    --    config = function()
    --        require('plugins.avante').setup()
    --    end
    --}

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
      require('packer').sync()
    end
end)
