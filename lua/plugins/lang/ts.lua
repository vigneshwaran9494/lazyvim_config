return {
  -- Enhanced TypeScript specific configurations
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
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
                includeInlayOptionalParameterHints = true,
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionLikeReturnTypeHintsSingleLine = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeCollidesWithName = false,
              },
              suggest = {
                includeCompletionsForModuleExports = true,
                includeCompletionsWithSnippetText = true,
                includeCompletionsWithInsertText = true,
                includeCompletionsWithReplaceText = true,
                includeCompletionsWithClassMemberSnippets = true,
                includeCompletionsWithObjectLiteralMethodSnippets = true,
                includeCompletionsWithFunctionParameterSnippets = true,
                includeCompletionsWithJSDocCommentSnippets = true,
                includeCompletionsWithImportStatementSnippets = true,
                includeCompletionsWithThisPropertySnippets = true,
                includeCompletionsWithThisFunctionSnippets = true,
                includeCompletionsWithThisMethodSnippets = true,
                includeCompletionsWithThisConstructorSnippets = true,
                includeCompletionsWithThisParameterSnippets = true,
                includeCompletionsWithThisVariableSnippets = true,
                includeCompletionsWithThisPropertyAccessSnippets = true,
                includeCompletionsWithThisMethodCallSnippets = true,
                includeCompletionsWithThisConstructorCallSnippets = true,
                includeCompletionsWithThisParameterCallSnippets = true,
                includeCompletionsWithThisVariableCallSnippets = true,
              },
              format = {
                indentSize = 2,
                tabSize = 2,
                convertTabsToSpaces = true,
                insertSpaceAfterCommaDelimiter = true,
                insertSpaceAfterSemicolonInForStatements = true,
                insertSpaceBeforeAndAfterBinaryOperators = true,
                insertSpaceAfterConstructor = false,
                insertSpaceAfterKeywordsInControlFlowStatements = true,
                insertSpaceAfterFunctionKeywordForAnonymousFunctions = true,
                insertSpaceAfterOpeningAndBeforeClosingNonemptyParenthesis = false,
                insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets = false,
                insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = true,
                insertSpaceAfterOpeningAndBeforeClosingTemplateStringBraces = false,
                insertSpaceAfterOpeningAndBeforeClosingJsxExpressionBraces = false,
                insertSpaceAfterTypeAssertion = false,
                insertSpaceBeforeFunctionParenthesis = false,
                placeOpenBraceOnNewLineForFunctions = false,
                placeOpenBraceOnNewLineForControlBlocks = false,
              },
              implementationsCodeLens = true,
              referencesCodeLens = true,
              referencesCodeLensOnAllFunctions = true,
            },
          },
        },
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

  -- Treesitter for TypeScript
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
          "toml",
        })
      end
    end,
  },

  -- Debugging for TypeScript applications
  {
    "mfussenegger/nvim-dap",
    optional = true,
    opts = function()
      local dap = require("dap")
      
      -- Node.js debugger for TypeScript
      if not dap.adapters["pwa-node"] then
        require("dap").adapters["pwa-node"] = {
          type = "server",
          host = "localhost",
          port = "${port}",
          executable = {
            command = "node",
            args = {
              require("mason-registry").get_package("js-debug-adapter"):get_install_path()
                .. "/js-debug/src/dapDebugServer.js",
              "${port}",
            },
          },
        }
      end

      -- TypeScript specific debug configurations
      for _, language in ipairs({ "typescript", "javascript" }) do
        if not dap.configurations[language] then
          dap.configurations[language] = {
            {
              type = "pwa-node",
              request = "launch",
              name = "Launch TypeScript App",
              program = "${workspaceFolder}/src/main.ts",
              cwd = "${workspaceFolder}",
              runtimeArgs = { "--nolazy" },
              env = {
                NODE_ENV = "development",
              },
              console = "integratedTerminal",
            },
            {
              type = "pwa-node",
              request = "launch",
              name = "Debug TypeScript Tests",
              program = "${workspaceFolder}/node_modules/.bin/jest",
              args = { "--runInBand", "--no-cache" },
              cwd = "${workspaceFolder}",
              console = "integratedTerminal",
              internalConsoleOptions = "neverOpen",
            },
            {
              type = "pwa-node",
              request = "attach",
              name = "Attach to TypeScript Process",
              processId = require("dap.utils").pick_process,
              cwd = "${workspaceFolder}",
            },
          }
        end
      end
    end,
  },

  -- Testing support for TypeScript
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

  -- Code formatting for TypeScript
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

  -- Linting for TypeScript
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

  -- TypeScript specific tools
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      opts.extensions = opts.extensions or {}
      opts.extensions["typescript"] = {
        -- TypeScript specific telescope extensions
      }
    end,
  },

  -- Auto-close tags for TSX
  {
    "windwp/nvim-ts-autotag",
    ft = { "typescript", "typescriptreact" },
    opts = {},
  },

  -- Snippets for TypeScript
  {
    "L3MON4D3/LuaSnip",
    opts = function(_, opts)
      opts.snippet_engine = "luasnip"
    end,
  },

  -- TypeScript specific file navigation
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

  -- Environment file support for TypeScript
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

  -- TypeScript specific keymaps
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