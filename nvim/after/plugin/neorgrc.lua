local ok, neorg = pcall(require, 'neorg')
if not ok then
  vim.notify('ERROR: Neorg not loaded.')
  return
end

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

neorg.setup {
  load = {
    ['core.defaults'] = {}, -- Loads default behaviour
    ['core.concealer'] = { -- Adds pretty icons to your documents
      config = {
        icons = {
          heading = {
            icons = { '🞇', '➜', '⮞', '🟏', '✦', '+' }
          },
          todo = {
            undone = { icon = " " },
            done = { icon = "✓" },
            pending = { icon = "" }
          }
        },
        icon_preset = 'varied',
        folds = false
      }
    },
    ['core.dirman'] = { -- Manages Neorg workspaces
      config = {
        workspaces = {
          notes = '~/.neorg',
        },
        default_workspace = 'notes'
      }
    },
    ['core.completion'] = {
      config = {
        engine = 'nvim-cmp'
      }
    }
  }
}

-- Concealer hides stuff by default
vim.o.cole = 2

-- Changes neorg anchor color
vim.cmd([[
  highlight @neorg.anchors.declaration ctermfg=11 gui=bold guifg=#37a2a0 guibg=#00000000
  highlight @neorg.links.description ctermfg=11 gui=bold guifg=#99aaff guibg=#00000000
]])
--vim.api.nvim_set_hl(0, '@neorg.anchors.declaration', { link = 'String' })

-- Keybinds
keymap('n', '<leader>nr', ':Neorg return<Return>', opts)
keymap('n', '<leader>ni', ':Neorg index<Return>', opts)
keymap('n', '<leader>ns', ':Neorg sync-parsers<Return>', opts)

