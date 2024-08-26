-- Check of packer is installed
local ok, packer = pcall(require, 'packer')
if not ok then
  vim.notify('ERROR: Packer not loaded.')
  return
end

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

-- Keymaps
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>ps', '<cmd>PackerSync<cr>', opts)

-- Packer start
packer.startup({function(use)
  use 'wbthomason/packer.nvim'  -- Packer can manage itself
  use 'nvim-lua/plenary.nvim' -- Nvim utils (Required by Telescope and Neorg)
  use 'onsails/lspkind-nvim'  -- Vscode-like pictograms

  -- Completion
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-path', -- Nvim-cmp source for paths
      'hrsh7th/cmp-buffer', -- Nvim-cmp source for buffer words
      'hrsh7th/cmp-nvim-lsp', -- Nvim-cmp source for neovim's built-in LSP
      'L3MON4D3/LuaSnip',  -- Snippets engine
      'saadparwaiz1/cmp_luasnip'  -- Makes luasnip work with cmp
    }
  }

  -- LSP
  use 'williamboman/mason.nvim' -- LSP server install helper
  use 'williamboman/mason-lspconfig.nvim' -- Help mason interface with nvim-lspconfig
  use 'neovim/nvim-lspconfig' -- LSP
  use 'glepnir/lspsaga.nvim'  -- LSP UI

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',  -- Auto-update treesitter parsers
  }
  use 'windwp/nvim-ts-autotag' -- Auto replace tags

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-telescope/telescope-file-browser.nvim'
    }
  }

  use 'RRethy/nvim-base16'  -- Colorscheme handler and maker
  use 'numToStr/FTerm.nvim' -- Floating terminal
  use 'nvim-lualine/lualine.nvim' -- Better statusline
  use 'akinsho/bufferline.nvim' -- Better bufferline for tabs
  use 'kyazdani42/nvim-web-devicons'  -- File icons (bufferline nd lualine depend on this by default)
  use 'windwp/nvim-autopairs' -- Auto close brackets, paren, commas, etc.
--  use 'tjdevries/colorbuddy.nvim' -- Colorscheme helper
  use 'NvChad/nvim-colorizer.lua' -- Show color on hex
  use 'lewis6991/gitsigns.nvim' -- Git decorations
  use 'folke/zen-mode.nvim' -- Goyo in lua
end,

  -- Make the packer interface float
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
})

