local ok, base16 = pcall(require, 'base16-colorscheme')
if not ok then
  vim.notify('ERROR: Base16 not loaded.')
  return
end

base16.setup({
  base00 = '', base01 = '#131319', base02 = '#1c1c26', base03 = '#6c7891',
  base04 = '#696969', base05 = '#cccccc', base06 = '#9a9bb3', base07 = '#b5b8eb',
  base08 = '#3080fa', base09 = '#cf464f', base0A = '#cf6f3f', base0B = '#99aaff',
  base0C = '#cccc00', base0D = '#af60d9', base0E = '#37a201', base0F = '#cf363f',
})

-- Colors I'm using to test stuff:
-- #3333ff #2e2eb8 #99aaff #49439f #37a201 #79241f #770000 #9a9bb3 #abb2bf #cf463f #37b291
-- Leaving base00 empty just makes it use the default background color
-- yogurt #e3a3f2 #37a2a0 #8f53b9 #9f5329
--#6060f0 #8f63d9 #3065d3
