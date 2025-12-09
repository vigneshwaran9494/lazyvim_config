return {
  -- NestJS specific LSP overrides
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
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

  -- NestJS specific debug configurations
  {
    "mfussenegger/nvim-dap",
    optional = true,
    opts = function()
      local dap = require("dap")

      -- NestJS specific debug configurations (extends base Node.js configs)
      for _, language in ipairs({ "typescript", "javascript" }) do
        if dap.configurations[language] then
          table.insert(dap.configurations[language], {
            type = "pwa-node",
            request = "launch",
            name = "Launch NestJS App",
            program = "${workspaceFolder}/src/main.ts",
            cwd = "${workspaceFolder}",
            runtimeArgs = { "--nolazy" },
            env = {
              NODE_ENV = "development",
            },
            console = "integratedTerminal",
          })
          table.insert(dap.configurations[language], {
            type = "pwa-node",
            request = "launch",
            name = "Debug NestJS Tests",
            program = "${workspaceFolder}/node_modules/.bin/jest",
            args = { "--runInBand", "--no-cache" },
            cwd = "${workspaceFolder}",
            console = "integratedTerminal",
            internalConsoleOptions = "neverOpen",
          })
        end
      end
    end,
  },

  -- Enhanced linting for NestJS (adds yaml linting)
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        yaml = { "yamllint" },
      },
    },
  },

  -- Database support for NestJS (TypeORM/Prisma)
  {
    "prisma/vim-prisma",
    ft = { "prisma" },
  },
}
