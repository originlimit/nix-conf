local ok, lualine = pcall(require, 'lualine')
if not ok then
  vim.notify('ERROR: Lualine not loaded.')
  return
end

-- Modify auto colors so lualine isn't dependent on base16 colorscheme plugin

-- Define a locals to avoid typing more
local custom = require'lualine.themes.16color'
local normal = custom.normal
local visual = custom.visual
local insert = custom.insert

-- 'A' section
normal.a.bg = '#abb2df'
normal.a.fg = '#000000'
visual.a.bg = '#999900'
visual.a.fg = '#000000'
insert.a.bg = '#99aaff'
insert.a.fg = '#000000'

-- 'B' section
normal.b.bg = '#00000000'
normal.b.fg = '#c5c8e6'

normal.c.bg = '#00000000'

lualine.setup {
  options = {
    section_separators = '',
    component_separators = '',
    theme = custom
  }
}
