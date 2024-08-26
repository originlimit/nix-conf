local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not ok then
  vim.notify('ERROR: Treesitter not loaded.')
  return
end

treesitter.setup {
  ensure_installed = {
    'haskell',
    'latex',
    'norg',
    'norg_meta',
    'markdown',
    'typescript',
    'javascript',
    'json'
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  }
}

