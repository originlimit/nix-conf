local ok, colorizer = pcall(require, 'colorizer')
if not ok then
  vim.notify('ERROR: Colorizer not loaded.')
  return
end

colorizer.setup({
  filetypes = { '*' },
  user_default_options = {
    tailwind = true,
    css = true
  }
})

-- NOTE: Exclusion only makes sense if '*' is specified.

