local ok, autotag = pcall(require, 'nvim-ts-autotag')
if not ok then
  vim.notify('ERROR: Nvim TS Autotag not loaded.')
  return
end

autotag.setup({})

