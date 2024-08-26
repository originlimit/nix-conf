-- Log level
-- vim.lsp.set_log_level('debug')

-- Check Lsp
local ok, nvim_lsp = pcall(require, 'lspconfig')
if not ok then
  return
end

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings :help vim.lsp*
  local bufopts = { noremap=true, silent=true, buffer=bufnr }

  --vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.notify('LSP attached!')
end

-- Signs in gutter
local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

-- Set up lsp to use cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  update_in_insert = false,
  virtual_text = { spacing = 4, prefix = "" },
  severity_sort = true,
})

vim.diagnostic.config({
  virtual_text = {
    prefix = 'E'
  },
  update_in_insert = false,
  float = {
    source = "always", -- Or "if_many"
  },
})

-- Borders
require('lspconfig.ui.windows').default_options.border = 'single'

--------------------------------------
--------- LSP Server Configs ---------
--------------------------------------

-- Haskell
nvim_lsp.hls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'haskell', 'lhaskell' },
  cmd = { 'haskell-language-server-wrapper', '--lsp' }
}

-- Lean4
nvim_lsp.leanls.setup{
  on_attach = on_attach,
  cmd = { 'lake', 'serve', '--' },
  filetypes = { 'lean' },
  options = {
    no_lake_lsp_cmd = { "lean", "--server" }
  },
  single_file_support = true,
  capabilities = capabilities
}

-- Idris2
--nvim_lsp.idris2_lsp.setup{
--  on_attach = on_attach,
--  capabilities = capabilities,
--  filetypes = { 'idris2' },
--  cmd = { 'idris2-lsp' }
--}

-- Texlab
nvim_lsp.texlab.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  filetype = { 'tex', 'plaintex', 'bib' },
  cmd = { 'texlab' },
  settings = {
    texlab = {
      auxDirectory = '.',
      latexFormatter = 'texlab',
      bibtexFormatter = 'texlab',
      build = {
        executable = 'tectonic',
        args = {
          '-X',
          'compile',
          '%f',
          '--untrusted',
          '--keep-logs',
          '--keep-intermediates'
        },
        onSave = true
      },
      formatterLineLength = 80
    }
  }
}

-- LTex
--nvim_lsp.ltex.setup{
--  settings = {
--    ltex = {
--      language = "en-US",
--    },
--  },
--  on_attach = on_attach,
--  capabilities = capabilities,
--  filetypes = { 'bib', 'gitcommit', 'org', 'plaintex', 'rst', 'rnoweb', 'tex' },
--  cmd = { 'ltex-ls' }
--}

-- Tailwindcss
nvim_lsp.tailwindcss.setup {
  on_attach = on_attach,
  filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx', 'javascriptreact', 'javascript', 'astro' },
  capabilities = capabilities
}

-- Typescript
nvim_lsp.tsserver.setup{
  on_attach = on_attach,
  filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx', 'javascriptreact', 'javascript' },
  cmd = { 'typescript-language-server', '--stdio' },
  capabilities = capabilities
}

-- emmet
nvim_lsp.emmet_ls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'astro', 'typescript.tsx' },
  init_options = {
    html = {
      options = {
        ['bem.enabled'] = true
      }
    }
  }
}

-- Lua
nvim_lsp.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { 'lua-language-server', '--stdio' },
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false
      },
    },
  },
}

