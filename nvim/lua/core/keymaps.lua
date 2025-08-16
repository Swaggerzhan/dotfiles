vim.g.mapleader = " "
local keymap = vim.keymap

-- move code in v mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- cancel highlight by search
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- nvim tree
keymap.set("n", "<leader>o", ":NvimTreeToggle<CR>")

-- bufferline
keymap.set("n", "L", ":bnext<CR>")
keymap.set("n", "H", ":bprevious<CR>")

-- git blame
keymap.set("n", "<leader>gg", ":EnableBlame<CR>")
keymap.set("n", "<leader>ggc", ":DisableBlame<CR>")

-- file different
keymap.set("n", "<leader>df", ":DiffviewFileHistory ")
keymap.set("n", "<leader>dc", ":DiffviewClose<CR>")
keymap.set("n", "<leader>do", ":DiffviewOpen ")
keymap.set("n", "<leader>dz", ":DiffviewToggleFiles<CR>")

-- Mappings.
-- See `:help vim.lsp.*` for documentation on any of the below functions
local bufopts = { noremap=true, silent=true }

keymap.set('n', 'gd', vim.lsp.buf.declaration, bufopts)
keymap.set('n', 'gi', vim.lsp.buf.definition, bufopts)
keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
-- ctrl + o for jump back
-- ctrl + i for jump in


-- for quick set pane
keymap.set('n', '<space>ll', "<C-w>30>")
keymap.set('n', '<space>hh', "<C-w>30<")

local function cmd(command)
   return table.concat({ '<Cmd>', command, '<CR>' })
end

vim.keymap.set('n', '<C-w>z', cmd 'WindowsMaximize')
vim.keymap.set('n', '<C-w>e', cmd 'WindowsEnableAutowidth')
vim.keymap.set('n', '<C-w>d', cmd 'WindowsDisableAutowidth')

-- for register
keymap.set('n', 'dd', '"_dd')
keymap.set('n', 'ciw', '"_ciw')

-- for inlay hints test
vim.keymap.set('n', '<leader>s',
    function() 
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({0}),{0}) 
    end
)

keymap.set("n", "<C-w>t", cmd 'TransparentToggle')

