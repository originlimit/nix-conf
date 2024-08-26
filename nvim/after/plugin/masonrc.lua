local ok, mason = pcall(require, 'mason')
if not ok then
  vim.notify('ERROR: Mason not loaded.')
  return
end

local ok_lsp, mason_lsp = pcall(require, 'mason-lspconfig')
if not ok_lsp then
  vim.notify('ERROR: Mason-LSP not loaded.')
  return
end

mason.setup({
  ui = {
    border = 'single',
    icons = {
      package_installed = '',
      package_pending = '󰅐',
      package_uninstalled = ''
    }
  }
})

mason_lsp.setup({
  ensure_installed = {
    'tailwindcss'
  }
})
