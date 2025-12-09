-- Base JavaScript/TypeScript configuration
local base_js_config = {
  -- TypeScript/JavaScript LSP
  tsserver = {
    settings = {
      typescript = {
        inlayHints = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
      javascript = {
        inlayHints = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
    },
  },
  -- ESLint for linting
  eslint = {
    settings = {
      workingDirectory = { mode = "auto" },
    },
  },
}

return {
  -- JavaScript/TypeScript Language Support
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = base_js_config,
    },
  },

  -- Treesitter for JavaScript/TypeScript
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "javascript",
          "typescript",
          "tsx",
          "jsx",
          "json",
          "jsonc",
        })
      end
    end,
  },

  -- Auto-close tags for JSX/TSX
  {
    "windwp/nvim-ts-autotag",
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    opts = {},
  },

  -- Snippets for JavaScript/TypeScript
  {
    "L3MON4D3/LuaSnip",
    opts = function(_, opts)
      opts.snippet_engine = "luasnip"
    end,
  },

  -- Code formatting
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "prettier", "eslint" },
        typescript = { "prettier", "eslint" },
        javascriptreact = { "prettier", "eslint" },
        typescriptreact = { "prettier", "eslint" },
        json = { "prettier" },
        jsonc = { "prettier" },
      },
    },
  },

  -- Linting
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        javascript = { "eslint" },
        typescript = { "eslint" },
        javascriptreact = { "eslint" },
        typescriptreact = { "eslint" },
      },
    },
  },
}
