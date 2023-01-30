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
require("lspconfig").sumneko_lua.setup {
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
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
require("lspconfig").rust_analyzer.setup {}
require("lspconfig").jsonls.setup {}
require("lspconfig").marksman.setup {}
require("lspconfig").graphql.setup {}
require("lspconfig").gopls.setup {}
require("lspconfig").pyright.setup {}
require("lspconfig").volar.setup {}
require("lspconfig").yamlls.setup {}

-- require("lspconfig").korean_ls.setup {}
