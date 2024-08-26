local ok, dec = pcall(require, 'decisive')
if not ok then
  vim.notify('ERROR: Lualine not loaded.')
  return
end

dec.setup {}
