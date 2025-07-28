return {
  -- React Native specific configurations
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Enhanced TypeScript LSP for React Native
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
              suggest = {
                includeCompletionsForModuleExports = true,
                includeCompletionsWithSnippetText = true,
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
        -- ESLint for React Native projects
        eslint = {
          settings = {
            workingDirectory = { mode = "auto" },
            codeAction = {
              disableRuleComment = {
                enable = true,
                insert = "line",
              },
            },
          },
        },
      },
    },
  },

  -- Treesitter for React Native file types
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "typescript",
          "tsx",
          "javascript",
          "jsx",
          "json",
          "jsonc",
          "yaml",
          "xml",
        })
      end
    end,
  },

  -- Debugging for React Native applications
  {
    "mfussenegger/nvim-dap",
    optional = true,
    opts = function()
      local dap = require("dap")
      
      -- React Native debugger
      if not dap.adapters["react-native"] then
        require("dap").adapters["react-native"] = {
          type = "executable",
          command = "npx",
          args = { "react-native", "debug" },
        }
      end

      -- React Native specific debug configurations
      for _, language in ipairs({ "typescript", "javascript" }) do
        if not dap.configurations[language] then
          dap.configurations[language] = {
            {
              type = "react-native",
              request = "launch",
              name = "Debug React Native App",
              program = "${workspaceFolder}/index.js",
              cwd = "${workspaceFolder}",
              platform = "ios", -- or "android"
            },
            {
              type = "react-native",
              request = "attach",
              name = "Attach to React Native",
              port = 8081,
              hostName = "localhost",
            },
          }
        end
      end
    end,
  },

  -- Testing support for React Native
  {
    "nvim-neotest/neotest",
    optional = true,
    opts = function(_, opts)
      opts.adapters = opts.adapters or {}
      vim.list_extend(opts.adapters, {
        require("neotest-jest")({
          jestCommand = "npm test --",
          jestConfigFile = "jest.config.js",
          env = { CI = true },
          cwd = function(path)
            return vim.fn.getcwd()
          end,
        }),
      })
    end,
  },

  -- Code formatting for React Native
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        typescript = { "prettier", "eslint_d" },
        javascript = { "prettier", "eslint_d" },
        typescriptreact = { "prettier", "eslint_d" },
        javascriptreact = { "prettier", "eslint_d" },
        json = { "prettier" },
        jsonc = { "prettier" },
        yaml = { "prettier" },
        yml = { "prettier" },
      },
    },
  },

  -- Linting for React Native
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        typescript = { "eslint_d" },
        javascript = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        javascriptreact = { "eslint_d" },
      },
    },
  },

  -- React Native specific tools
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      opts.extensions = opts.extensions or {}
      opts.extensions["react-native"] = {
        -- React Native specific telescope extensions
      }
    end,
  },

  -- Auto-close tags for JSX/TSX
  {
    "windwp/nvim-ts-autotag",
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    opts = {},
  },

  -- Snippets for React Native
  {
    "L3MON4D3/LuaSnip",
    opts = function(_, opts)
      opts.snippet_engine = "luasnip"
    end,
  },

  -- React Native specific file navigation
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      filters = {
        dotfiles = false,
        git_ignored = false,
      },
      git = {
        enable = true,
        ignore = false,
      },
    },
  },

  -- Environment file support for React Native
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          -- dotenv files are typically handled by basic parsers
        })
      end
    end,
  },

  -- React Native specific keymaps
  {
    "folke/which-key.nvim",
    opts = {
      plugins = {
        marks = true,
        registers = true,
        spelling = {
          enabled = true,
          suggestions = 20,
        },
      },
    },
  },
} 