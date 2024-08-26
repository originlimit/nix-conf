local ok, zen = pcall(require, 'zen-mode')
if not ok then
  vim.notify('ERROR: Zen-mode not loaded.')
  return
end

-- Define keymap for later use
local keymap = vim.keymap.set

zen.setup {
  window = {
    backdrop = 1,
    width = .45,
    height = .85,
    options = {
      number = false,
      relativenumber = false,
      signcolumn = "no"
    },
    plugins = {
      gitsigns = { enabled = false }
    }
  }
}

-- Set toggle keymap
keymap('n', '<leader>g', '<cmd>ZenMode<cr>', { silent = true, noremap = true })
