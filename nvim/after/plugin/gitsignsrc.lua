local ok, signs = pcall(require, 'gitsigns')
if not ok then
  vim.notify('ERROR: Gitsigns not loaded.')
  return
end

signs.setup({})
