local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

require("luasnip.loaders.from_vscode").lazy_load()

-- 下面会用到这个函数
local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end


cmp.setup({
  formatting = {
    format = function(_, vim_item)
      vim_item.menu = ""
      vim_item.kind = ""
      return vim_item
    end
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    -- ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
    -- ['<C-e>'] = cmp.mapping.abort(),  -- not really used, ESC can also exit
    ['<CR>'] = cmp.mapping.confirm({ select = true }),

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif check_backspace() then
        fallback()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  }),

  --
  sources = cmp.config.sources({
    {
      name = 'nvim_lsp',
      -- max show auto completion item count
      max_item_count = 10,
      -- The source-specific keyword length to trigger auto completion
      keyword_length = 2,
    },
    { 
      name = 'luasnip',
      entry_filter = function(entry)
        return require("cmp").lsp.CompletionItemKind.Snippet ~= entry:get_kind()
      end
    },
    { 
      name = 'path' 
    },
    --{ max_item_count = 7 },
  }, 
  {
    --{ name = 'buffer' },
  })
})
