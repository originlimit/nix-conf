local ok, bufferline = pcall(require, 'bufferline')
if not ok then
  vim.notify('ERROR: Bufferline not loaded.')
  return
end

bufferline.setup ({
  options = {
    --mode = 'tabs',  -- IF ENABLED, SEE COMMENT FOR gt & gT KEYBINDS BELOW
    show_close_icon = false,
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    modified_icon = '',
    separator_style = 'thin'
  }
})

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Keybinds
keymap('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', opts)
keymap('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', opts)

-- Disable prev and enable these if 'mode = 'tabs''
keymap('n', '<S-Tab>', 'gt', opts)
keymap('n', '<S-Tab>', 'gT', opts)
