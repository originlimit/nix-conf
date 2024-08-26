local ok, base16 = pcall(require, 'mini.base16')
if not ok then
  vim.notify('ERROR: Mini base16 not loaded.')
  return
end

base16.setup({
  palette = {
    base00 = '#000000', base01 = '#131319', base02 = '#1c1c26', base03 = '#6c7891',
    base04 = '#696969', base05 = '#c5c8e6', base06 = '#9a9bb3', base07 = '#f5c8e6',
    base08 = '#37b291', base09 = '#cf463f', base0A = '#6963f0', base0B = '#99aaff',
    base0C = '#999900', base0D = '#6963f0', base0E = '#8f53b9', base0F = '#ccacdc',
  }
})
