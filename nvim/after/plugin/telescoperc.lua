local ok, telescope = pcall(require, 'telescope')
if not ok then
  vim.notify('ERROR: Telescope not loaded.')
  return
end

local actions = require('telescope.actions')

telescope.setup {
  defaults = {
    winblend = 10,
    prompt_prefix = ' λ ',
    sorting_strategy = 'ascending',
    layout_strategy = 'vertical',
    initial_mode = 'normal',
    layout_config = {
      --prompt_position = 'top'
    },
    mappings = {
      n = {
        ['q'] = actions.close
      }
    },
  },
  extensions = {
    file_browser = {
      previewer = true,
      results_title = '',
      hidden = true,
      layout_config = {
        height = 0.8,
        prompt_position = 'top'
      },
      hijack_netrw = true
    }
  }
}

-- Needs to be called AFTER setup function for the hijack to work
telescope.load_extension('file_browser')

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- Telescope binds
keymap('n', '<leader>ff', '<cmd>Telescope find_files<CR>', opts)
keymap('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', opts)
keymap('n', '<leader>fb', '<cmd>Telescope buffers<CR>', opts)
keymap('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', opts)

-- Telescope file browser bind
keymap('n', '<leader>fd', '<cmd>Telescope file_browser<CR>', opts)

-- Highlights because of course it doesnt pick sensible defaults with base16
vim.cmd([[
  highlight TelescopeBorder guifg=#c5c8e6
  highlight TelescopePromptBorder guifg=#c5c8e6 guibg=#00000000
  highlight TelescopeResultsTitle guibg=#8f53b9
]])
