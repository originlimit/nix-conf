local ok, line = pcall(require, 'ibl')
if not ok then
  vim.notify('ERROR: Indent-blankline not loaded.')
  return
end

line.setup({})
