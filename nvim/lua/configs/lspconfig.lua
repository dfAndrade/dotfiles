-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "pyright", "gleam" }

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = function()
      on_attach()
      vim.diagnostic.config {
        virtual_text = false,
      }
    end,

    on_init = on_init,
    capabilities = capabilities,
  }
end

-- lspconfig.elixirls.setup {
--   cmd = { "elixir-ls" },
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}
