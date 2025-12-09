return {
  -- LSP Installer
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "typescript-language-server", -- Changed from "tsserver"
        "tailwindcss-language-server",
        "json-lsp",
        "html-lsp",
        "css-lsp",
        "emmet-ls",
        "prisma-language-server", -- For database schema files
      },
    },
  },

  -- LSP Config
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -- Common LSP setup
      local on_attach = function(client, bufnr)
        -- Enable formatting on save
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ async = false })
            end,
          })
        end
      end

      -- Configure language servers
      lspconfig.tsserver.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      lspconfig.html.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      lspconfig.cssls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      lspconfig.emmet_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
      })

      lspconfig.prismals.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      lspconfig.graphql.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "graphql", "gql" },
      })
    end,
  },
}

