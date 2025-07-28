return {
    -- LSP Installer
    {
      "williamboman/mason.nvim",
      opts = {
        ensure_installed = {
          "typescript-language-server", -- Changed from "tsserver"
          "eslint",
          "tailwindcss",
          "jsonls",
        },
      },
    },
  
    -- LSP Config
    {
      "neovim/nvim-lspconfig",
      config = function()
        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
  
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
  
        lspconfig.eslint.setup({
          capabilities = capabilities,
          on_attach = on_attach,
        })
  
        lspconfig.tailwindcss.setup({
          capabilities = capabilities,
          on_attach = on_attach,
        })
      end,
    },
  }