-- Bootstrap lazy. If not present, installs it
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Define keymap and opts
local keymap = vim.keymap.set
local keyopts = { noremap = true, silent = true }

-- Declare all plugins and their dependencies
local plugins = {
  'nvim-lua/plenary.nvim', -- Nvim utils (Required by Telescope and Neorg)
  'onsails/lspkind-nvim',  -- Vscode-like pictograms

  -- Completion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-path', -- Nvim-cmp source for paths
      'hrsh7th/cmp-buffer', -- Nvim-cmp source for buffer words
      'hrsh7th/cmp-nvim-lsp', -- Nvim-cmp source for neovim's built-in LSP
      'L3MON4D3/LuaSnip',  -- Snippets engine
      'saadparwaiz1/cmp_luasnip'  -- Makes luasnip work with cmp
    }
  },

  -- LSP
  'williamboman/mason.nvim', -- LSP server install helper
  'williamboman/mason-lspconfig.nvim', -- Help mason interface with nvim-lspconfig
  'neovim/nvim-lspconfig', -- LSP
  'glepnir/lspsaga.nvim',  -- LSP UI

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },

  'windwp/nvim-ts-autotag', -- Auto replace tags

  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-telescope/telescope-file-browser.nvim'
    }
  },

  'lukas-reineke/indent-blankline.nvim',  -- Indent guides
  'RRethy/nvim-base16',  -- Colorscheme handler and maker
  'numToStr/FTerm.nvim', -- Floating terminal
  'nvim-lualine/lualine.nvim', -- Better statusline
  'akinsho/bufferline.nvim', -- Better bufferline for tabs
  'kyazdani42/nvim-web-devicons',  -- File icons (bufferline nd lualine depend on this by default)
  'windwp/nvim-autopairs', -- Auto close brackets, paren, commas, etc.
  --'tjdevries/colorbuddy.nvim', -- Colorscheme helper
  'NvChad/nvim-colorizer.lua', -- Show color on hex
  'lewis6991/gitsigns.nvim', -- Git decorations
  'folke/todo-comments.nvim',
  'folke/zen-mode.nvim', -- Goyo in lua
  --'dstein64/vim-startuptime',

  -- CSV handler
  {
    "emmanueltouzery/decisive.nvim",
    ft = {'csv'}
  },

  -- Neorg
  {
    'nvim-neorg/neorg'
--    version = '7.0.0' -- Pin Neorg to the latest stable release
  }
}

local opts = {
  rocks = {
    hererocks = true
  }
}

require("lazy").setup(plugins, opts)

-- Package manager sync key
keymap('n', '<leader>ps', ':Lazy<Return>', keyopts)

