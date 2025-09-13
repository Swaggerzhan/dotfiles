local telescope = require('telescope')
local builtin = require('telescope.builtin')
local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")

--telescope.setup{
require('telescope').setup {
    defaults = {
        file_ignore_patterns = { 
            ".git/",
            "build/",
            "output/",
            "test/",
        },
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--trim',
        },
        matching_strategy = "strict", 
        initial_mode = "normal", -- open telescope with normal mode

        -- for layout foramt
        layout_strategy = "horizontal",
        layout_config = { 
            height = 0.99,
            width = 0.98,
            preview_width = 0.5
        },

        -- mapping
        mappings = {
            i = {
                ["<C-c>"] = actions.close, -- quick close
                ['<C-j>'] = actions.cycle_history_next,
                ['<C-k>'] = actions.cycle_history_prev,
            },
            n = {
                ["<C-c>"] = actions.close, -- quick close
                ['<C-j>'] = actions.cycle_history_next,
                ['<C-k>'] = actions.cycle_history_prev,
            },
        },
    }
}

-- add plugin for args grep
require('telescope').load_extension('live_grep_args')


vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

vim.keymap.set('n', '<leader>fl', function()
  require('telescope').extensions.live_grep_args.live_grep_args()
end, {})

vim.keymap.set('n', '<leader>fo', builtin.buffers, {})
vim.keymap.set('n', '<leader>fr', builtin.resume, {}) -- resume before search history
vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, {}) -- list symbol

vim.keymap.set('n', '<leader>fb', builtin.current_buffer_fuzzy_find, {}) -- find line in opened file

vim.keymap.set('n', '<leader>gs', builtin.git_status, {})

