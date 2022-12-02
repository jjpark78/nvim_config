local signs = { Error = "", Warn = "", Hint = "", Info = "" }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = false,
  update_in_insert = true,
  severity_sort = false,
})

require("lspconfig").tsserver.setup {}
require("lspconfig").sumneko_lua.setup {}
require("lspconfig").rust_analyzer.setup {}
require("lspconfig").jsonls.setup {}
require("lspconfig").marksman.setup {}
require("lspconfig").graphql.setup {}
require("lspconfig").gopls.setup {}
require("lspconfig").pyright.setup {}
require("lspconfig").volar.setup {}
require("lspconfig").yamlls.setup {}
