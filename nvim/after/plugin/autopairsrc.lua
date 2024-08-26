local ok, npairs = pcall(require, 'nvim-autopairs')
if not ok then
  vim.notify('ERROR: Autopairs not loaded.')
  return
end

npairs.setup({})

--this is a comment
