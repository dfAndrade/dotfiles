local map = vim.keymap.set
local conf = require("nvconfig").ui.lsp
return {
  {
    "nvim-treesitter/nvim-treesitter-context",
    cmd = "TSContextToggle",
    config = function()
      require("treesitter-context").setup {
        enable = false,
      }
    end,
  },
  {
    "elixir-tools/elixir-tools.nvim",
    version = "*",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local elixir = require "elixir"
      local elixirls = require "elixir.elixirls"

      elixir.setup {
        nextls = { enable = true },
        credo = {},
        elixirls = {
          enable = true,
          settings = elixirls.settings {
            dialyzerEnabled = false,
            enableTestLenses = false,
          },
          on_attach = function(client, bufnr)
            local function opts(desc)
              return { buffer = bufnr, desc = "LSP " .. desc }
            end
            map("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
            map("n", "gd", vim.lsp.buf.definition, opts "Go to definition")
            map("n", "gi", vim.lsp.buf.implementation, opts "Go to implementation")
            map("n", "<leader>sh", vim.lsp.buf.signature_help, opts "Show signature help")
            vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
            vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
            vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })

            map("n", "<leader>ra", function()
              require "nvchad.lsp.renamer"()
            end, opts "NvRenamer")

            map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts "Code action")
            map("n", "gr", vim.lsp.buf.references, opts "Show references")

            -- setup signature popup
            if conf.signature and client.server_capabilities.signatureHelpProvider then
              require("nvchad.lsp.signature").setup(client, bufnr)
            end
          end,
        },
      }
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}
