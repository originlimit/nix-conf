local ok, cmp = pcall(require, 'cmp')
if not ok then
  vim.notify('ERROR: Nvim-CMP not loaded.')
  return
end

-- Define add-on plugins
local lspkind = require('lspkind')
local luasnip = require('luasnip')

cmp.setup({
  -- Set vim.cmd[[set completeopt=menuone,noinsert,noselect]]
  completion = {
    completeopt = 'menuone,noinsert,noselect'
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  -- Set keymaps
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
  }),

  -- Declare sources
  sources = cmp.config.sources({
    { name = 'luasnip', max_item_count = 6 },
    { name = 'nvim_lsp', max_item_count = 6 },
    { name = 'path', max_item_count = 6 },
    { name = 'buffer', max_item_count = 6 },
    { name = 'neorg', max_item_count = 6 }
  }),

  -- Declare formatting
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol',
      maxwidth = 50
    })
  },

  -- Decoration
  window = {
    documentation = {
      border = {'┌', '─', '┐', '│', '┘', '─', '└', '│'}
    },
    completion = {
      border = {'┌', '─', '┐', '│', '┘', '─', '└', '│'},
      winhighlight = 'Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None'
    }
  },

  -- Set behavior on confirm
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace
  }
})

vim.cmd [[
  highlight! default link CmpItemKind CmpItemMenuDefault
  highlight CmpItemAbbr guifg=#c5c8e6 guibg=#00000000
]]

