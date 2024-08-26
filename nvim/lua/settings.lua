local o = vim.o
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader key
vim.g.mapleader = ' '

-- Encoding
vim.scriptencoding = 'utf-8'
o.encoding = 'utf-8'
o.fileencoding = 'utf-8'

-- Disable netrw
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- Backup and swap files
o.swapfile = false
o.backup = false
o.undofile = true

-- Make nvim use the system clipboard
o.clipboard = 'unnamedplus'

-- Global statusline
o.laststatus = 3

-- General settings
o.incsearch = true
o.termguicolors = true
o.number = true
o.relativenumber = true
o.expandtab = true
o.smartindent = true
o.hlsearch = false
o.splitright = true
o.splitbelow = true
o.wrap = false
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2
o.ignorecase = true
o.smartcase = true
o.background = 'dark'
vim.wo.cursorline = true
vim.wo.colorcolumn = '80'

-- Colors
vim.cmd([[
  highlight ColorColumn guibg=reverse cterm=reverse
  highlight CursorLineNr cterm=underline ctermfg=11 gui=bold guifg=#99aaff guibg=#13
]])

-- LSP show info
keymap('n', '<leader>k', ':LspInfo<Return>')

-- Open a terminal in different splits (with no numbers)
keymap('n', '<leader>st', ':sp|:terminal<cr>:setlocal nonumber norelativenumber<cr>', opts)
keymap('n', '<leader>vt', ':vsp|:terminal<cr>:setlocal nonumber norelativenumber<cr>', opts)
keymap('n', '<leader>bt', ':terminal<cr>:setlocal nonumber norelativenumber<cr>', opts)
