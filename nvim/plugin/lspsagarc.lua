local ok, saga = pcall(require, 'lspsaga')
if not ok then
  vim.notify('ERROR: Lspsaga not loaded.')
  return
end

saga.setup({
  symbol_in_winbar = {
    enable = true,
    separator = "  ",
    show_file = false
  },
  ui = {
    border = 'single',
    winblend = 10,
    code_action = '󰌶',
    colors = {
      normal_bg = '#000000',
      red = '#cf4638',
      magenta = '#99aaff',
      orange = '#6963f0',
      yellow = '#999900',
      green = '#37a2a0',
      cyan = '#99aaff',
      blue = '#6963f0',
      purple = '#8f53b9',
      white = '#c5c8e6',
      black = '#1c1c26',
    }
  }
})

-- Keymaps
local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

keymap('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
keymap('n', 'gh', '<Cmd>Lspsaga hover_doc<CR>', opts)
keymap('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
keymap('n', 'ga', '<Cmd>Lspsaga code_action<CR>', opts)
keymap('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts)
keymap('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
keymap('n', '<leader>t', '<Cmd>Lspsaga term_toggle<CR>', opts)
keymap('t', '<C-q>', [[<C-\><C-n><cmd>Lspsaga term_toggle<CR>]], { silent = true })
