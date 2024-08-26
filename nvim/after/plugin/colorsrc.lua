-- TO BE REDONE IN LUA

-- Hardcoded colors for lsp diagnostics
vim.cmd([[
  highlight DiagnosticError ctermfg=15 guifg=#cc0000 guibg=#0c0000
  highlight DiagnosticSignError ctermfg=15 guifg=#cc0000 guibg=#00000000

  highlight DiagnosticWarn ctermfg=10 guifg=#cc6600 guibg=#0c0600
  highlight DiagnosticSignWarn ctermfg=10 guifg=#cc6600 guibg=#00000000

  highlight DiagnosticHint ctermfg=10 guifg=#cccc00 guibg=#0c0c00
  highlight DiagnosticSignHint ctermfg=10 guifg=#cccc00 guibg=#00000000
]])

-- Cursor number and cursorline
vim.cmd([[
  highlight CursorLineNr cterm=underline ctermfg=11 gui=bold guifg=#99aaff guibg=#13
]])
