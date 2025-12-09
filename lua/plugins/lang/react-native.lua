return {
  -- React Native specific LSP overrides
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

  -- React Native specific debug configurations
  {
    "mfussenegger/nvim-dap",
    optional = true,
    opts = function()
      local dap = require("dap")

      -- React Native specific debug configurations (extends base Node.js configs)
      for _, language in ipairs({ "typescript", "javascript" }) do
        if dap.configurations[language] then
          table.insert(dap.configurations[language], {
            type = "pwa-node",
            request = "launch",
            name = "Debug React Native App",
            program = "${workspaceFolder}/index.js",
            cwd = "${workspaceFolder}",
            runtimeArgs = { "--inspect" },
            console = "integratedTerminal",
            env = {
              NODE_ENV = "development",
            },
          })
          table.insert(dap.configurations[language], {
            type = "pwa-node",
            request = "attach",
            name = "Attach to React Native Packager",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
            protocol = "inspector",
          })
        end
      end
    end,
  },

  -- React Native specific file types
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "xml", -- for Android XML layouts
        })
      end
    end,
  },
}