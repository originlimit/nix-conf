local ok, tree = pcall(require, 'nvim-tree')
if not ok then
  vim.notify('ERROR: Nvim-tree not loaded.')
  return
end

-- Disable netrw at the start of init.lua
--vim.g.loaded = 1
--vim.g.loaded_netrwPlugin = 1

tree.setup({
  renderer = {
    group_empty = true
  },
  view = {
    signcolumn = 'no',
    number = false,
    relativenumber = false
  }
})
